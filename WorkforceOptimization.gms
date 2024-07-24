SETS
    i /skilled, semiskilled, unskilled/
    t /0*3/;

PARAMETERS
    demand(i,t) /skilled.0 1000, skilled.1 1000, skilled.2 1500, skilled.3 2000,
                 semiskilled.0 1500, semiskilled.1 1400, semiskilled.2 2000, semiskilled.3 2500,
                 unskilled.0 2000, unskilled.1 1000, unskilled.2 500, unskilled.3 0/
    attrition_lt_1(i) /skilled 0.10, semiskilled 0.20, unskilled 0.25/
    attrition_gt_1(i) /skilled 0.05, semiskilled 0.05, unskilled 0.10/
    hire_limit(i) /skilled 500, semiskilled 800, unskilled 500/
    suspend_cost(i) /skilled 500, semiskilled 500, unskilled 200/
    train_cost(i) /skilled 0, semiskilled 500, unskilled 400/
    overhire_cost(i) /skilled 1500, semiskilled 2000, unskilled 3000/
    parttime_cost(i) /skilled 500, semiskilled 400, unskilled 400/
    parttime_cap(i) /skilled 50, semiskilled 50, unskilled 50/
    train_capacity(i) /skilled 0, semiskilled 0, unskilled 200/
    overhire_cap(i) /skilled 150, semiskilled 150, unskilled 150/;

VARIABLES
    N(i,t)    'Number of workers in year t'
    E(i,t)    'Number of workers hired in year t'
    Tr(i,t)   'Number of workers trained to a higher skill level in year t'
    S(i,t)    'Number of workers suspended in year t'
    O(i,t)    'Number of workers over-hired in year t'
    P(i,t)    'Number of workers assigned to part-time work in year t'
    z         'Objective function';

POSITIVE VARIABLES N, E, Tr, S, O, P;

EQUATIONS
    worker_balance(i,t) 'Worker balance equation'
    hiring_capacity(i,t) 'Hiring capacity constraint'
    training_capacity(i,t) 'Training capacity constraint'
    suspension_capacity(i,t) 'Suspension capacity constraint'
    overhire_capacity(i,t) 'Over-hiring capacity constraint'
    parttime_capacity(i,t) 'Part-time capacity constraint'
    demand_satisfaction(i,t) 'Demand satisfaction constraint'
    objective 'Objective function';

worker_balance(i,t+1).. 
    N(i,t+1) =e= (N(i,t) - (IF(t=0, 0, attrition_lt_1(i)) + IF(t>0, attrition_gt_1(i))) * N(i,t)) 
                + E(i,t) + Tr(i,t) - S(i,t) - O(i,t) + P(i,t);

hiring_capacity(i,t).. 
    E(i,t) =l= hire_limit(i);

training_capacity(i,t).. 
    Tr(i,t) =l= train_capacity(i);

suspension_capacity(i,t).. 
    S(i,t) =l= 10000;

overhire_capacity(i,t).. 
    O(i,t) =l= overhire_cap(i);

parttime_capacity(i,t).. 
    P(i,t) =l= parttime_cap(i);

demand_satisfaction(i,t).. 
    N(i,t) =g= demand(i,t);

objective.. 
    z =e= sum((i,t), suspend_cost(i) * S(i,t) + train_cost(i) * Tr(i,t) + overhire_cost(i) * O(i,t) + parttime_cost(i) * P(i,t));

MODEL workforce_optimization /all/;

SOLVE workforce_optimization MINIMIZING z USING LP;

DISPLAY N.l, E.l, Tr.l, S.l, O.l, P.l, z.l;
# OperationalResearch-WorkforceOptimization


## Problem Statement

The company is adapting to changes that will impact its workforce due to new machinery installations and an anticipated economic recession. This project aims to optimize workforce management using GAMS.

### Current and Future Workforce Requirements

| Worker Type   | Current | Year 1 Need | Year 2 Need | Year 3 Need |
|----------------|---------|--------------|--------------|--------------|
| Skilled        | 1000    | 1000         | 1500         | 2000         |
| Semi-skilled   | 1500    | 1400         | 2000         | 2500         |
| Unskilled      | 2000    | 1000         | 500          | 0            |

### Policy Objectives

The company focuses on four key areas:

1. Hiring of workers
2. Training of workers
3. Suspension of workers
4. Over-hiring of workers
5. Allocation of part-time workers

### Attrition Rates

| Worker Type   | Less than 1 Year | More than 1 Year |
|----------------|-------------------|-------------------|
| Skilled        | 10%               | 5%                |
| Semi-skilled   | 20%               | 5%                |
| Unskilled      | 25%               | 10%               |

### Constraints and Costs

1. **Hiring Limits**:
   - Skilled: 500 per year
   - Semi-skilled: 800 per year
   - Unskilled: 500 per year

2. **Training**:
   - Train 200 unskilled workers annually at 400 units each.
   - Train semi-skilled to skilled at a cost of 500 units each, up to 25% of the current skilled workforce.

3. **Suspension Costs**:
   - Unskilled: 200 units
   - Semi-skilled/Skilled: 500 units

4. **Over-hiring**:
   - Additional 150 hires/year:
     - Skilled: 1500 units
     - Semi-skilled: 2000 units
     - Unskilled: 3000 units

5. **Part-time Workers**:
   - 50 part-time workers annually for each type, at half productivity:
     - Skilled: 500 units
     - Semi-skilled: 400 units
     - Unskilled: 400 units

### Problem Goals
 
 **Minimize Suspended Workers**: What decisions should be made?

### Problem Formulation

We aim to minimize the number of suspended workers in a company over a three-year period while considering various constraints such as hiring, training, suspensions, over-hiring, and part-time work.


![image](https://github.com/user-attachments/assets/d4c97622-1015-49f5-900e-792c4f51240c)


## Model
![image](https://github.com/user-attachments/assets/e5b46916-016a-4367-98f5-e0a998204001)
![image](https://github.com/user-attachments/assets/e2485cd2-85a6-450a-9a1d-560f7832356d)

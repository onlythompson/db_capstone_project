# Review Guidelines

### Step1 : Database Setup
-   Run the `LittleLemonDB-ForwardEngineeringScript.sql` in MySQl Workbench
#### OR
-   Open the `LittleLemonDB.mwb` File and use Forward Engineering (Recommended)
-   Note: Tables and required views are  created using any of these approaches.

### Step 2: Perform default inserts to help in review
-   Run the file `DefaultInsertOperations_For_Testing.sql` in  MySQl Workbench

### Step 3: Execute the required Project Procedures 
-   Run the file `Procedures.sql` in  MySQl Workbench - This will create all the project procedures required for your review
### Step 4: Testing the Procedures and Prepared Statement
-   Run the required procedure test using files that start with Test-**.sql e:g `Test-CancelOrder-Procedure.sql`
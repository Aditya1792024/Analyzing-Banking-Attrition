<img src="/Images/churn_project_bg.JPG" width="600" height="340"/>
<h1>ABC Bank: Customer Attrition Insights and Retention Solutions</h1>
<h2>Problem Statement:</h2>
<h2>Dataset:</h2>
<p>This dataset contains customer information from ABC Bank, used to analyze and address customer attrition. It includes the following columns:</p>
<ul>
    <li><strong>RowNumber</strong>: Unique identifier for each row.</li>
    <li><strong>CustomerId</strong>: Unique identifier for each customer.</li>
    <li><strong>Surname</strong>: Customer's last name.</li>
    <li><strong>CreditScore</strong>: Customer's credit score.</li>
    <li><strong>Geography</strong>: Customer's country.</li>
    <li><strong>Gender</strong>: Customer's gender (Male or Female).</li>
    <li><strong>Age</strong>: Customer's age.</li>
    <li><strong>Tenure</strong>: Number of years the customer has been with the bank.</li>
    <li><strong>Balance</strong>: Customer's account balance.</li>
    <li><strong>NumOfProducts</strong>: Number of bank products used by the customer.</li>
    <li><strong>HasCrCard</strong>: Indicates if the customer has a credit card (1 = Yes, 0 = No).</li>
    <li><strong>IsActiveMember</strong>: Indicates if the customer is an active member (1 = Yes, 0 = No).</li>
    <li><strong>EstimatedSalary</strong>: Customer's estimated salary.</li>
    <li><strong>Exited</strong>: Indicates if the customer has churned (1 = Yes, 0 = No).</li>
</ul>
<h2>Data Cleaning:</h2>
<p>The following operations were performed to clean the dataset:</p>
<ul>
    <li><strong>Identify and Remove Duplicate Values</strong>: Duplicates were found in the <em>CustomerId</em> column and subsequently removed to ensure data integrity. <br><br><img src="/Images/ss2.jpg" alt="Duplicate Removal Image" width="400" height="99"><br></li>
    <li><strong>Dealing with Data Inconsistencies</strong>: Inconsistencies were identified and resolved in the <em>Geography</em> column to standardize the data. <br><br><img src="/Images/ss3.jpg" alt="Irregularities in Geography Column" width="140" height="200">&nbsp;&nbsp;&nbsp;<img src="/Images/ss4.jpg" alt="Resolving inconsistencies" width="454" height="200"></li>
</ul>
<h2>Data Transformations:</h2>
<p>The dataset underwent a series of transformations to enhance its usability for analyzing customer attrition and developing retention strategies. The initial step involved creating a framework to categorize numerical data into meaningful groups, laying the foundation for more detailed segmentation. This process included the following specific activities:</p>
<ul>
    <li><strong>Categorizing Customers into Age Groups</strong>: Segmented customers into age-based groups for better analysis. <br><br><img src="/Images/ss5.jpg" alt="Resolving inconsistencies" width="329" height="150"></li>
    <li><strong>Categorizing Customers Based on Tenure</strong>: Classified customers according to their tenure with the bank. <br><br><img src="/Images/ss6.jpg" alt="Resolving inconsistencies" width="330" height="150"></li>
    <li><strong>Categorizing Customers Based on Salary</strong>: Grouped customers based on their estimated salary ranges. <br><br><img src="/Images/ss7.jpg" alt="Resolving inconsistencies" width="395" height="150"></li>
    <li><strong>Categorizing Customers Based on Credit Score</strong>: Divided customers into categories based on their credit scores. <br><br><img src="/Images/ss8.jpg" alt="Resolving inconsistencies" width="336" height="150"></li>
</ul>
<h2>Kay Insights:</h2>
<ul>
    <li>The overall churn rate is 20.37%.</li>
    <li>Female customers exhibit a higher churn rate of 25.07%.</li>
    <li>Customers in the Senior Adult age group (41-60) show the highest attrition rate at 39.65%.</li>
    <li>Attrition among female customers in the Senior Adult age group reaches 45.80%.</li>
    <li>German customers experience a higher attrition rate of 32.44% compared to other regions.</li>
    <li>Among German customers, new customers have a significantly high attrition rate of 38.21%.</li>
    <li>Inactivity among new German customers may be the primary reason for attrition, as inactive customers contribute 51% to the total churn.</li>
    <li>Notably, female customers with a credit card who are active are less likely to leave, whereas those with a card who are inactive have the highest likelihood of churning.</li>
    <li>Inactivity among customers might stem from dissatisfaction with bank products, as those using 3 or 4 products show a churn rate exceeding 88%.</li>
    <li>The Adult age group constitutes the largest share of total customers and experiences significantly lower churn rates.</li>
    <li>Attrition among younger customers is impressively low.</li>
    <li>Although the Senior Adult age group contributes the largest share to attrition, it also includes a higher percentage of customers using more than one product.</li>
</ul>




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
    <li><strong>Categorizing Customers into Age Groups</strong>: Segmented customers into age-based groups for better analysis. <img src="age_group_categorization_image.png" alt="Age Group Categorization Image"></li>
    <li><strong>Categorizing Customers Based on Tenure</strong>: Classified customers according to their tenure with the bank. <img src="tenure_categorization_image.png" alt="Tenure Categorization Image"></li>
    <li><strong>Categorizing Customers Based on Salary</strong>: Grouped customers based on their estimated salary ranges. <img src="salary_categorization_image.png" alt="Salary Categorization Image"></li>
    <li><strong>Categorizing Customers Based on Credit Score</strong>: Divided customers into categories based on their credit scores. <img src="credit_score_categorization_image.png" alt="Credit Score Categorization Image"></li>
</ul>




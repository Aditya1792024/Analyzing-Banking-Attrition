<img src="/Images/churn_project_bg.JPG" width="600" height="340"/>
<h1>ABC Bank: Customer Attrition Insights and Retention Solutions</h1>
<h2>Problem Statement:</h2>
<p>ABC BAnk is confronting a critical challenge with an overall churn rate of 20%. Following an initial assessment, noticeable churning has been identified among female customers, the Senior Adult age group, and the Germany region, signaling potential underlying issues. As a data analyst, I am tasked with resolving this issue by delivering valuable insights to investigate the driving factors behind the attrition, developing effective strategies to reduce churn, and exploring areas of growth to enhance long-term profitability.</p>
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
<h2>Key Insights:</h2>
<ul>
    <li>The overall churn rate is 20.37%. <br><br><img src="/Images/ss9.jpg" alt="Resolving inconsistencies" width="250" height="57">&nbsp;&nbsp;&nbsp;<img src="/Images/ss10.jpg" alt="Resolving inconsistencies" width="239" height="57"></li>
    <li>Female customers exhibit a higher churn rate of 25.07%. <br><br><img src="/Images/ss11.jpg" alt="Resolving inconsistencies" width="300" height="118">&nbsp;&nbsp;&nbsp;<img src="/Images/ss12.jpg" alt="Resolving inconsistencies" width="300" height="93"></li>
    <li>Customers in the Senior Adult age group (41-60) show the highest attrition rate at 39.65%. <br><br><img src="/Images/ss13.jpg" alt="Resolving inconsistencies" width="350" height="137">&nbsp;&nbsp;&nbsp;<img src="/Images/ss14.jpg" alt="Resolving inconsistencies" width="538" height="130"></li>
    <li>Attrition among female customers in the Senior Adult age group reaches 45.80%. <br><br><img src="/Images/ss16.jpg" alt="Resolving inconsistencies" width="293" height="150">&nbsp;&nbsp;&nbsp;<img src="/Images/ss17.jpg" alt="Resolving inconsistencies" width="480" height="150"></li>
    <li>German customers experience a higher attrition rate of 32.44% compared to other regions. <br><br><img src="/Images/ss18.jpg" alt="Resolving inconsistencies" width="350" height="103">&nbsp;&nbsp;&nbsp;<img src="/Images/ss19.jpg" alt="Resolving inconsistencies" width="350" height="125"></li>
    <li>Among German customers, new customers have a significantly high attrition rate of 38.21%.<br><br><img src="/Images/ss22.jpg" alt="Resolving inconsistencies" width="400" height="84">&nbsp;&nbsp;&nbsp;<img src="/Images/ss23.jpg" alt="Resolving inconsistencies" width="316" height="124"></li>
    <li>Inactivity among new German customers may be the primary reason for attrition, as inactive customers contribute 51% to the total churn. <br><br><img src="/Images/ss20.jpg" alt="Resolving inconsistencies" width="380" height="76">&nbsp;&nbsp;&nbsp;<img src="/Images/ss21.jpg" alt="Resolving inconsistencies" width="345" height="103"></li>
    <li>Notably, female customers with a credit card who are active are less likely to leave, whereas those with a card who are inactive have the highest likelihood of churning. <br><br><img src="/Images/ss24.jpg" alt="Resolving inconsistencies" width="400" height="93">&nbsp;&nbsp;&nbsp;<img src="/Images/ss25.jpg" alt="Resolving inconsistencies" width="360" height="106"></li>
    <li>Inactivity among customers might stem from dissatisfaction with bank products, as those using 3 or 4 products show a churn rate exceeding 88%. <br><br><img src="/Images/ss26.jpg" alt="Resolving inconsistencies" width="336" height="150">&nbsp;&nbsp;&nbsp;<img src="/Images/ss27.jpg" alt="Resolving inconsistencies" width="336" height="150"></li>
    <li>The Adult age group constitutes the largest share of total customers and experiences significantly lower churn rates.</li>
    <li>Attrition among younger customers is impressively low.</li>
    <li>Although the Senior Adult age group contributes the largest share to attrition, it also includes a higher percentage of customers using more than one product. <br><br><img src="/Images/ss15.jpg" alt="Resolving inconsistencies" width="281" height="150"></li>
</ul>

<h2>Recommendations:</h2>
<ul>
    <li>Develop specialized retention campaigns for female customers, particularly those in the Senior Adult age group (41-60), where attrition reaches 45.80%. Offer personalized financial products, such as retirement planning tools or flexible credit options, to enhance engagement and reduce churn.</li>
    <li>Encourage credit card usage and active participation among female customers. Promote benefits for active cardholders and identify inactive cardholders for targeted re-engagement campaigns to lower their high churn risk.</li>
    <li>Focus on activating new customers in Germany, where attrition is 38.21% and inactivity contributes 51% to churn. Implement onboarding programs with incentives like welcome bonuses or regular check-ins to boost early engagement.</li>
    <li>Customers purchasing more than two products experience churn rates exceeding 85%, potentially indicating dissatisfaction or a lack of product variety. To mitigate this, analyzing customer feedback can help identify the root cause of dissatisfaction.</li>
    <li>Leverage the minimal churn and substantial customer base within the Adult age group (25-40) by implementing loyalty programs or promoting additional services, solidifying their loyalty and boosting their lifetime value. Although this group experiences low attrition, approximately 50% of members remain inactive, offering a prime opportunity to increase profitability by addressing inactivity through tailored engagement strategies like personalized incentives or improved digital tools.</li>
    <li>As the second-largest segment with the highest churn rate, the Senior Adult group (41-60) shows a stronger tendency to purchase multiple products (6%) compared to Adults (26-40) at 1.9% and Young customers (18-25) at 1.6%. Focus on product bundling and personalized engagement to boost retention and increase high-value transactions.</li>
    <li>Maintain the impressively low attrition among younger customers with educational resources or introductory offers, ensuring they remain satisfied and less likely to leave. Additionally, take steps to increase the younger customer base through targeted marketing campaigns, such as student discounts or innovative digital banking features tailored to their preferences.</li>
</ul>

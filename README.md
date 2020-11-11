# Healthcare-Classification-Problem
## Overview
Recent Covid-19 Pandemic has raised alarms over one of the most overlooked area to focus: Healthcare Management. While healthcare management has various use cases for using data science, patient length of stay is one critical parameter to observe and predict if one wants to improve the efficiency of the healthcare management in a hospital. This parameter helps hospitals to identify patients of high LOS risk (patients who will stay longer) at the time of admission. Once identified, patients with high LOS risk can have their treatment plan optimized to minimize LOS and lower the chance of staff/visitor infection. 
## Data Description
Data source is from Kaggle (https://www.kaggle.com/nehaprabhavalkar/av-healthcare-analytics-ii ). The dataset contains features related to patient, hospital and length of stay on case basis. It includes 318,438 observations. There are 18 variables that includes 17 features variables and 1 class variable.
Below is the data dictionary for length of stay data.

### Column: Description
1. case_id	:Case_ID registered in Hospital
2. Hospital_code:Unique code for the Hospital
3. Hospital_type_code:	Unique code for the type of Hospital
4. City_Code_Hospital:	City Code of the Hospital
5. Hospital_region_code:	Region Code of the Hospital
6. Available Extra Rooms in Hospital:	Number of Extra rooms available in the Hospital
7. Department:	Department overlooking the case
8. Ward_Type:	Code for the Ward type
9. Ward_Facility_Code:	Code for the Ward Facility
10. Bed Grade:	Condition of Bed in the Ward
11. patientid:	Unique Patient Id
12. City_Code_Patient:	City Code for the patient
13. Type of Admission:	Admission Type registered by the Hospital
14. Severity of Illness:	Severity of the illness recorded at the time of admission
15. Visitors with Patient:	Number of Visitors with the patient
16. Age:	Age of the patient
17. Admission_Deposi:t	Deposit at the Admission Time
18. Stay:	Stay Days by the patient

## Proposed Methodology
I will start with data cleaning and preparation and use holdout or cross validation to split training set and test set. Random forest will be conducted for classification. Finally, I will use accuracy, precision and recall to evaluate model performance. 

## Random Forest
![rf1 accruacy](https://user-images.githubusercontent.com/72762392/98865869-083f4780-243a-11eb-9517-65c76e52c356.JPG)

![rf2 importance](https://user-images.githubusercontent.com/72762392/98865889-0ecdbf00-243a-11eb-982d-b28ef61ab2b8.JPG)

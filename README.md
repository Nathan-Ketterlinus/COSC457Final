# **Team Members**
Nathan Ketterlinus  
Nick Arellano  
Selena Hamilton  
Nkechiyem Molokwu  
Haley Elliott

# **Interviewee Signature**

Desiree Wimberly

# **Introduction**

Our group started this DBMS project in August 2024. We have selected the small event planning business Desired Designs Events, which belongs to an acquaintance of a team member, to develop a DBMS for. This small business takes charge of event planning for customers who want to hold some kind of party or event as well as creating party favors for the event. The business owner is the sole employee at this moment and as such handles all customer interactions personally. As a small business with only one employee, customer records are currently handled ad-hoc. 

By creating a DBMS the business will be better equipped to easily add, retrieve, expand, and alter records of customers. Additionally, the owner often contracts vendors for purchasing, hiring and renting supplies, equipment, catering, etc. for customer events. Information pertaining to these vendors such as their costs and services should be organized into the database as well and correlated with customer events that require their services.  

We are working in a group of five on this project. To create an Entity Relationship Diagram modeling the schema of the database we are using DIA. In order to reinforce and implement what we’ve learned about databases, and to refine our approach to developing a database management system, we are focused on delivering a DBMS that contains all information that pertains to the needs of the business owner and any necessary operations to be performed on the database that assist in the operation of the business.


# **Target Business**

Desired Designs Events focuses on providing event planning and preparation for customers who want to hold a small party of 50 or less, as well as the creation of party favors as part of the event or separate from any event. It is run solely by the current owner, but for the purpose of this project we will treat the business as having multiple workers who report back to the owner about assigned events.

The owner of the business advertises their business through social media and word-of-mouth. Customers who are interested in submitting a request for a consultation may provide all relevant information though an online form submission hosted on Jotform. This form contains fields to input information to assist in planning an event for the customer.   

As an online business, it has no defined locations or branches, but it does have a service area that consists of the Delaware-Maryland-Virginia area. The employees themselves are treated as all being based in Baltimore. Currently it is only advertised on Instagram which contains a link to a landing page containing relevant links to the business. When filling out a form for a consultation a customer may choose to also fill out a form for party favors.


# **Business Process**

The business process begins when a client contacts Desired Designed Events to plan an event. The client provides initial information such as the event type, date, budget, theme, and number of attendees (must be less than 50). The event coordinator uses this information to create a client record in the system and prepares a proposal and cost estimate. 

Once a job is accepted the following workflow occurs: 

**Client Registration and Event Scheduling**
1. The coordinator registers the client and event details in the system.  
2. The system checks for date availability and avoids double-booking.  
3. A unique Event ID is assigned, linking the client, assigned staff, and vendors.

**Vendor and Supplier Coordination**
1. The system stores a list of preferred vendors (e.g., florists, caterers, rental companies).  
2. The coordinator selects vendors based on availability, price, and client preferences.  
3. Vendor contracts and delivery schedules are recorded in the database.

**Inventory and Rental Management**
1. The system tracks all items required for the event—such as linens, furniture, and décor.  
2. Each item record includes its availability status, quantity, and condition.  
3. When items are rented externally, the system logs the vendor name, rental cost, and return deadline.

**Design, Decoration, and Party Favors**
1. Staff assigned to design and decoration enter planned color schemes, materials, and quantities.  
2. Party favor orders are recorded with details such as design type, number of guests, and delivery date.  
3. The database allows cross-referencing between event themes and materials inventory.  
   1. Makes it easier to search but also may make it harder to create and so this may not be implemented in the time we have.  

**Event Execution and Monitoring**
1. On the day of the event, the assigned team checks the task list and status dashboard.  
2. Each task (setup, catering, decoration, etc.) is marked as complete when finished.  
3. Supervisors record any issues, changes, or additional costs in real-time.

**Post-Event Wrap-Up**
1. After the event, the system updates inventory by marking returned or damaged items.  
2. Final payments are processed, and vendor invoices are paid.  
3. Client feedback and event outcomes are recorded for future reference or promotional material.

# **User Requirements**

## **Process Modelling Requirements**

We define the following User requirements:  

Clients are anyone who are over the age of 18. In addition to their date of birth, we also store the client’s payment information, first and last name, and assign them a unique client ID for easy identification. Clients can order party favors and/or events. A customer requests an event by assigning information for an event such as an event name, date, time, location, theme, and colors. If the event is accepted, a worker will then give the event a unique ID and begin an invoice for the event which consists of the number of hours an event will take and if the event is paid for or not. When a customer orders party favors they supply the company with information about what kind of favor it is, the amount they need and a deadline they need the favors by. A worker then creates a unique ID for the favor order, an invoice for the favor which details the number of hours needed to create the favors, whether or not the favors are paid for, and the price of the materials needed to create the favors, as well as recording if the favors are already made or not.


If an event needs certain equipment that the company has in its inventory, then it can be rented directly from the company for a cost. We track the item ID, price, kind, quantity, and return date of the equipment rented and charge the customer accordingly. Additionally, this system allows the company to track how many of each kind of item in their inventory is currently available. Alternatively, if the company needs to rent equipment or services from an external contractor for an event, like a DJ or a photographer, we note the kind of job we hire, the total cost, and the phone number of our contractor while also assigning them a unique ID. The additional cost of these services is then passed on to the customer.


When a client orders a favor, they will communicate ahead of time with their assigned employee whether or not the company is responsible for the materials to create them. If the client is providing materials, then the material price will be $0, and the price will not be included in the Invoice. If the client is not providing materials, then the material price will be \>$0, and this cost will be reflected in the invoice. We note that favors can exist separately from an event, or as part of an event, depending on the client’s intention.  

Outside of our direct communication with Desired Designs Events, we also define a Worker entity that takes on three responsibilities:
1. Creating favors  
2. Planning events  
3. Working with clients.

This is to introduce additional complexity appropriate for the project, while also being relevant to the business in the event that it ever expands to hire more people.  
Based on the information we have, we can easily make reports tracking revenue, dates of upcoming events, and deadlines of uncompleted party favors.  

Formally, we define the following entities & their attributes:
- Client(CID, CName, CDoB, PaymentInfo)  
- Favor(FID, FKind, FAmount, FDeadline, FInvoice, FIsMade)  
- Event(EID, EName, EDate, ETime, ELocation, ETheme, EColors, EInvoice)  
- Inventory(IID, IPrice, IItemKind, IQuantity, IQuantityInUse, IReturnDate)  
- Contractor(ContID, Job, Cost, Phone\#)  
- Worker(WID, WName, Salary, WDoB, Address, SSN)

With these entities, we define the following relationships:
- A Client plans events.  
- A Client purchases favors.  
- Favors can be part of an event.  
- Events may borrow from inventory.  
- Events may hire contractors  
- Workers plan events  
- Clients are assigned to a worker  
- Workers create favors

## **Data Modelling Requirements**
To populate our database, we allow the database user to manually populate info for clients, contractors, events, favors, inventory, and workers. Additionally, we allow the user to:
1) Manually update all of the above information  
2) Generate lists of events, favors, clients, contractors, inventory items, etc.  
3) Generate list of contractors that perform a certain job  
4) Produce list of items currently available in inventory  
5) Produce list of recent expenses  
6) Track list of unpaid invoices  
7) Produce list of upcoming deadlines  
8) Track list of created favors  
9) Track who is actively renting from the company

## **Expected Database Queries**
1) Sum sales for a given time period  
2) List dates of upcoming events  
3) List dates of past events  
4) List dates of upcoming favor deadlines  
5) List the names of customers currently renting an item from the company  
6) Calculate price of an event based on hours worked & material cost  
7) Calculate price of a favor based on hours worked & material cost  
8) Calculate cost of all contractors for a given time period 
9) Ensure customer’s DOB is \> 18 years ago  
10) Find the amount of a given item not being rented in inventory

# **ERD & Schema**

## **Entity Relationship Diagram**

<img width="512" height="372" alt="1" src="https://github.com/user-attachments/assets/165d02bc-df8c-4300-95c7-329bea3a73bd" />

### **Assumptions:**

* An event is only requested by a single client.  
* An order for party favors is only requested by one client. 
* Only one worker is assigned to one client.  
* An employee will calculate an estimated return date for each inventory item used for an event.

## **Schema**

<img width="512" height="303" alt="2" src="https://github.com/user-attachments/assets/31d2272c-ea9d-41b2-8d6d-812bde6e51d3" />

# **Gantt Chart**

<img width="512" height="210" alt="3" src="https://github.com/user-attachments/assets/6d63be9a-1c94-4f84-bb0c-079d5da7840b" />

# **Task List**

| Task Name | Duration | Start Date | Finish Date | Team Member |
| :---- | :---- | :---- | :---- | :---- |
| Project Requirement Gathering | 9 Days | 09/3 | 09/12 | All |
| Prepare Interview Questions | 2 Days | 09/12 | 09/14 | Selena Hamilton |
| Conduct Interviews & Analysis | 9 Days | 09/15 | 09/24 | Selena Hamilton, All |
| Draw ERD | 3 Days | 09/30 | 10/02 | Nathan Ketterlinus |
| Identify Database Queries | 5 Days | 09/30 | 10/04 | Nick Arellano, Nkechiyem Molokwu |
| Schema Development | 5 Days | 10/12 | 10/17 | Haley Elliot |
| Application Development | 16 Days | 10/12 | 10/28 | Nathan Ketterlinus |
| Create Database in MySQL | 7 Days | 10/18 | 10/23 | Nick Arellano |
| Integration and Database Testing | 5 Days | 10/29 | 11/02 | Haley Elliot |
| Documentation Creation | 5 Days | 11/03 | 11/08 | Nathan Ketterlinus, Nkechiyem Molokwu |
| Prepare Presentation | 7 Days | 11/09 | 11/16 | All |
| Practice Presentation | 14 Days | 11/17 | 12/1 | All |
| Presentation in Class | 1 Days | 12/02 | 12/4 | All |

# **Meeting Log**

## **Initial Meeting**

### Meeting Date/Time:

September 14, 2025/6:30 pm.

### Location:

Virtual Zoom meeting

### Topics Discussed:

Usability and future outlook/uses of the database. Discussion of report completion and division of work. Timeline for finishing project report. The next step is to finalize documentation of the requirements and interview responses for the project such that we may begin the ERD, schema, and report sections.

### Tasks Assigned:

- Nathan Ketterlinus-ERD, Gantt Chart, UI, Reference Manual
- Nick Arellano-Background Information, User Requirements, Table creation and initialization scripts
- Nkechiyem Molokwu-User Requirements, Introduction, Tutorial Manual
- Selena Hamilton-Interview, Business Requirements, Business Process, SQL Scripting
- Haley Elliott-Schema, Task List, Business Process, Connecting table and queries to frontend

### Tasks Accomplished:

Assignment of tasks and discussion of project topics. We finalized the interview questions and discussed where we would like to go with this project.

### Incidents:

N/A

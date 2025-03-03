Donation Center Management System

A comprehensive management solution for a university clothing donation program serving over 3,000 students. This project includes data collection, processing, analysis, and visualization components.
Show Image
🎯 Project Overview
Designed and implemented for one of Canada's top universities, this system streamlines donation inventory management, checkout processes, and analytics reporting.

Note: Data has been modified for privacy concerns while maintaining the integrity of the system's design and functionality.

🛠️ Technology Stack

Excel/SharePoint: Initial data collection and interface system
Python: Data processing and privacy protection (Excel to JSON conversion)
MySQL: Database for structured storage and complex querying
Google Cloud Platform: Database hosting and accessibility
Google Looker Studio: Interactive visualization dashboards

📁 Repository Structure
donation-center/
│
├── database/
│   ├── schema.sql              # Database structure creation script
│   ├── queries.sql             # Analytical queries for reporting
│   └── db_diagram.png          # Entity relationship diagram
│
├── python/
│   ├── excel_to_json.py        # Data conversion script with privacy protection
│   └── data_processor.py       # Data cleaning and normalization utilities
│
├── dashboards/
│   ├── dashboard_embed.html    # Embedded Looker Studio dashboard
│   └── dashboard_screenshots/  # Static images of key visualizations
│
└── excel/
    └── original_system/        # Templates of the Excel-based system
📊 Key Features

Multi-phase Implementation: Evolution from Excel to full database system
Data Normalization: Optimized database structure for reporting efficiency
Privacy Protection: Python processing to anonymize student data
Interactive Dashboards:

Checkout analytics
Inventory management
Staff and operational costs



📈 Analytics Capabilities
The system provides six core analytical reports:

Checkout Details: Transaction-level auditing
Item Popularity: Frequency metrics for inventory planning
Monthly Trends: Time-series analysis of student reach
Program Distribution: Student demographics by academic program
Inventory Usage: 4-month comparative stock analysis
Staff Payroll: Labor tracking and expense management

🚀 Getting Started

Clone this repository
Set up MySQL instance or use the provided Docker configuration
Run schema.sql to create database structure
Use Python scripts to process and load sample data
Execute queries from queries.sql to generate analytics
View sample dashboards in the dashboards directory

📝 License
This project is licensed under the MIT License - see the LICENSE file for details.
🔗 Related Links

Full Project Portfolio
Interactive Dashboard Demo
Technical Documentation


Developed by Rodrigo Murilo Barros • LinkedIn • Email

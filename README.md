# Donation Center Management System

A comprehensive management solution for a university clothing donation program serving over 3,000 students. This project includes data collection, processing, analysis, and visualization components.

<img width="797" alt="Screenshot 2025-03-02 at 10 44 24 PM" src="https://github.com/user-attachments/assets/cd4b4920-a8f8-4519-ae74-6d535b2e1b6d" />

---

## 🎯 Project Overview

Designed and implemented for one of Canada's top universities, this system streamlines donation inventory management, checkout processes, and analytics reporting.

> **Note:** Data has been modified for privacy concerns while maintaining the integrity of the system's design and functionality.

---

## 🛠️ Technology Stack

- **Excel/SharePoint**: Initial data collection and interface system
- **Python**: Data processing and privacy protection (Excel to JSON conversion)
- **MySQL**: Database for structured storage and complex querying
- **Google Cloud Platform**: Database hosting and accessibility
- **Google Looker Studio**: Interactive visualization dashboards

---

## 📁 Repository Structure

```
donation-center/
│
├── database/
│   ├── schema.sql              # Database structure creation script
│   ├── queries.sql             # Analytical queries for reporting
│   └── db_diagram.png          # Entity relationship diagram
│
├── python/
│   ├── csv_to_json.py        # Data conversion script with privacy
│
├── dashboards/
│   ├── dashboard_embed.html    # Embedded Looker Studio dashboard
│   └── costs.png  # Static images of key visualizations
│   └── check_outs.png  # Static images of key visualizations
│   └── inventory.png  # Static images of key visualizations
│
```

---

## 📊 Key Features

- **Multi-phase Implementation**: Evolution from Excel to full database system
- **Data Normalization**: Optimized database structure for reporting efficiency
- **Privacy Protection**: Python processing to anonymize student data
- **Interactive Dashboards**: 
  - Checkout analytics
  - Inventory management
  - Staff and operational costs

---

## 📈 Analytics Capabilities

The system provides six core analytical reports:

1. **Checkout Details**: Transaction-level auditing
2. **Item Popularity**: Frequency metrics for inventory planning
3. **Monthly Trends**: Time-series analysis of student reach
4. **Program Distribution**: Student demographics by academic program
5. **Inventory Usage**: 4-month comparative stock analysis
6. **Staff Payroll**: Labor tracking and expense management

---

## 🚀 Getting Started

1. Clone this repository
2. Set up MySQL instance or use the provided Docker configuration
3. Run `schema.sql` to create database structure
4. Use Python scripts to process and load sample data
5. Execute queries from `queries.sql` to generate analytics
6. View sample dashboards in the dashboards directory

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🔗 Related Links

- [Full Project Portfolio](https://sites.google.com/view/rbarros/projects/clothing-donation-store-dashboard?authuser=0)
- [Interactive Dashboard Demo](https://lookerstudio.google.com/s/iH_TfyguhLM)

---

<div align="center">

Developed by [Rodrigo Murilo Barros](https://github.com/RodrigoSeneca) • [LinkedIn](https://www.linkedin.com/in/rodrigombarros25) • [Email](mailto:rodrimurilo@outlook.com)

</div>

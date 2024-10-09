# Talk2Data_SnowflakeAI

Here’s a sample `README.md` file for your generative AI application:

---

# Snowflake Cost Optimization AI Assistant

## Overview

This is a generative AI application built using **Cortex Analyst** of Snowflake to optimize and manage Snowflake compute costs efficiently. By leveraging an advanced **semantic model**, the AI assistant helps users ask natural language questions about Snowflake credit usage and receive insightful answers. This tool empowers teams to manage and reduce costs by providing detailed insights into Snowflake credit consumption across domains, warehouses, and users.

## Key Features

- **Natural Language Queries**: Users can ask natural language questions like:
  - "What is the maximum total credits consumption of each domain during last month?"
  - "Give me the usernames who used XXXL warehouse size during last month."
  - "Give me the usernames who used XXXL warehouse size during last month. Also provide the dates when they used them."
  
- **Semantic Model**: Built using Snowflake’s Cortex Analyst, the application interprets complex cost-related questions and provides accurate answers based on the semantic model.

- **Cost Monitoring and Optimization**:
  - Track credit consumption across warehouses, users, and domains.
  - Detect and analyze usage patterns for cost spikes or inefficient resource usage.
  - Provide automated recommendations for cost optimization.

## Problems Solved

1. **Credit Usage Transparency**:
   - Gain a comprehensive view of Snowflake credit consumption across domains, warehouses, and users.

2. **Query Optimization**:
   - Identify inefficiencies in query execution and recommend improvements to reduce credits spent.

3. **Warehouse Right-Sizing**:
   - Track warehouse size usage (XS, S, M, L, XL, XXL, XXXL, XXXXL) to ensure resources are allocated efficiently.
  
4. **Cost Reporting**:
   - Generate automated reports and insights into monthly credit consumption for various domains and users.

## Example Use Cases

- **Monthly Credit Consumption**:
  ```plaintext
  "What is the maximum total credits consumption of each domain during last month?"
  ```

- **Warehouse Usage Monitoring**:
  ```plaintext
  "Give me the usernames who used XXXL warehouse size during last month."
  ```

- **Detailed User Activity**:
  ```plaintext
  "Give me the usernames who used XXXL warehouse size during last month. Also provide the dates when they used them."
  ```

## Technical Details

- **Platform**: Snowflake
- **Generative AI Tool**: Cortex Analyst (Snowflake)
- **Language Support**: Python, SQL
- **Data Sources**: Snowflake ACCOUNT_USAGE schema for tracking query history and warehouse utilization.

## Getting Started

### Prerequisites

1. **Snowflake Account** with access to the following:
   - `ACCOUNT_USAGE` schema to track query history and warehouse usage.
   - Properly configured **semantic model** for the generative AI engine.

2. **Python 3.8+** with required packages for Snowflake integration.

### Installation

1. Clone the repository:
   ```bash
   https://github.com/tusharagarwal19/Talk2Data_SnowflakeAI
   ```

2. Install required packages:
   ```bash
   pip install .
   pip install streamlit snowflake-snowpark-python ```

  in your local Python environment
   

3. Open up the cortex_analyst_streamlit.py file in your preferred local code editor
Modify the following parameters with your respective account information: HOST, user, password, and account information
Run the Streamlit app using streamlit run cortex_analyst_streamlit.py

### Usage

- Open the AI Assistant application and start asking cost-related questions using natural language.
- Example questions you can ask:
  ```plaintext
  "What is the total credits spent by domain RAD last week?"
  "Who used the largest warehouse size in ESG during Q3?"
  ```

## Contributing

If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are welcome.

## License

This project is licensed under the MIT License. See the `LICENSE.md` file for details.

---

This `README.md` provides an overview of the project, installation steps, use cases, and technical details to help users understand and run the application.

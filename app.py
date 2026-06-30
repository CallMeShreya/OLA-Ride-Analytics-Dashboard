import streamlit as st

st.set_page_config(page_title="OLA Ride Insights")

st.title("OLA Ride Insights Dashboard")

st.header("Project Overview")

st.write("""
This project analyzes OLA ride booking data using SQL and Power BI.

Key Analysis:
- Ride Volume
- Revenue
- Vehicle Performance
- Ratings
- Cancellations
""")

st.header("Key Findings")

st.write("""
1. Cash generated highest revenue.
2. Prime Sedan performed strongly.
3. Driver ratings remained above 4.
4. Most rides completed successfully.
""")

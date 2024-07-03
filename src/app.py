import streamlit as st
from datetime import datetime
import subprocess

def calculate_lunar_phase(date):
    result = subprocess.run(['julia', 'lunar_phase.jl', date], capture_output=True, text=True)
    return result.stdout.strip()

st.title("Lunar Phase Calculator")

date_input = st.date_input("Select a date", datetime.today())

if st.button("Calculate Lunar Phase"):
    lunar_phase = calculate_lunar_phase(date_input.strftime("%Y-%m-%d"))
    st.write(f"The lunar phase on {date_input.strftime('%Y-%m-%d')} is: {lunar_phase}")

# 🧬 Predicting Splice Junctions in DNA Sequences Using Machine Learning

> **“Classifying exon-intron boundaries through intelligent sequence decoding – merging genomics with machine learning.”**

---

## 🚀 Project Overview
This project explores a machine learning-driven approach to **classify DNA sequences into splice site types** – a critical problem in bioinformatics. The classification includes:
- **EI (Exon-Intron junction)**
- **IE (Intron-Exon junction)**
- **N (Non-Splice sites)**

We apply **Python and R-based modeling**, robust **feature engineering**, and **biological pattern visualizations** to enhance gene annotation accuracy.

---

## 🧠 Problem Statement
Splice junction detection is pivotal for gene expression and protein synthesis analysis. Traditional motif-based methods lack flexibility for diverse biological sequences. Our challenge was to:
- Handle **high-dimensional DNA data**
- Extract meaningful nucleotide patterns
- Apply ML models to learn splice site features automatically

---

[![Watch the video](https://img.youtube.com/vi/sGUtIR6pUaU/0.jpg)](https://www.youtube.com/watch?v=sGUtIR6pUaU)

## 📊 Dataset Summary
| Feature | Description |
|--------|-------------|
| Source | UCI Machine Learning Repository |
| Records | 3,175 sequences |
| Length | 60 nucleotides per sequence |
| Classes | EI, IE, N |

---

## 🧪 Tools & Technologies
| Language | Tools/Frameworks |
|---------|------------------|
| Python | pandas, numpy, scikit-learn, tensorflow |
| R | ggplot2, tidyverse, ggpubr, ggridges, ggseqlogo, ggalluvial |

---

## 🧩 Methodology & Workflow
1. **Data Preprocessing**
   - One-hot encoding
   - k-mer frequency extraction
2. **Exploratory Data Analysis (EDA)** using R:
   - Nucleotide frequency plots
   - GC content distribution
   - Top 2-mers and 3-mers
   - Splice site motif visualization
   - Sankey plots for nucleotide transitions
3. **Model Implementation**
   - Logistic Regression
   - Random Forest
   - Optimized Random Forest (GridSearchCV)
   - Deep Neural Networks (TensorFlow)
4. **Performance Evaluation**
   - Accuracy, Precision, Recall, F1-score
   - Confusion Matrices & Feature Importance plots

---

## 📈 Model Evaluation Summary
| Model | Accuracy | Precision | Recall | F1-score |
|-------|---------|-----------|--------|----------|
| Logistic Regression | 94.04% | 94.15% | 94.04% | 94.07% |
| Random Forest | 96.55% | 96.61% | 96.55% | 96.56% |
| Optimized RF | 96.55% | 96.63% | 96.55% | 96.57% |
| Deep Neural Network | 94.67% | 94.79% | 94.67% | 94.71% |

---

## 📂 Repository Structure
```
predicting-splice-junctions-ml/
├── data/                            → Sample DNA dataset
├── notebooks/
│   ├── Team_15_DSEM_Mini_Project.ipynb → Python modeling & training
│   └── plots.R                         → EDA visualizations in R
├── reports/
│   ├── Team15_Project_Report.pdf      → Final report
│   ├── MiniProject_Group15.pptx       → Presentation slides
│   └── Team15_Proposal_DSEM_MiniProject.pdf → Project proposal
├── results/                         → Confusion matrix, metrics, feature importance
├── YouTube Video Link.txt          → 1-min video pitch: https://www.youtube.com/watch?v=sGUtIR6pUaU
├── requirements.txt                → Python dependencies
└── README.md                       → Project documentation
```

---

## 🛠 How to Run the Code
### Python Setup:
```bash
pip install -r requirements.txt
jupyter notebook Team_15_DSEM_Mini_Project.ipynb
```
### R Setup:
Open and run `plots.R` in your R environment to generate all DNA visualizations.

---

## 🌟 Key Contributions
✔ Developed a robust ML classification pipeline for DNA splice site detection  
✔ Achieved over 96% accuracy with optimized Random Forest  
✔ Visualized biological patterns via custom-built R plots  
✔ Delivered full documentation, reporting, and a one-minute project pitch video

---

## 📎 Deliverables Summary
- 🧠 Python ML Workflow (Jupyter Notebook)
- 📊 EDA & Visualization Script (R Script)
- 📄 Final Report PDF
- 📽 Slide Deck (PPTX)
- 📃 Project Proposal
- 🔗 YouTube Presentation Video

---

## 🔍 Insights & Learnings
- GC content and positional features were most influential
- RF and DNN models outperformed traditional ML
- Strong synergy of bioinformatics + ML offers future research scope

---

## 📬 To reach out to me
**Raghavendra Prasath Sridhar**  
📧 Email: sridhar.r@northeastern.edu
🔗 LinkedIn: linkedin.com/in/raghavendraprasath/ 
🐙 GitHub: github.com/raghavendraprasath

---

> ⭐ *If you found this project interesting, consider giving it a star and following the repository!*

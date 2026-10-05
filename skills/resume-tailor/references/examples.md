# Worked example (fictional candidate; illustrates the rules, not any real person)

A fictional CS co-op student with three internships applies to an **"AI Engineer Intern"** posting. The team is AI Platform, inside Infrastructure & Platform.

The posting's must-haves are:
- PyTorch, Python
- CI/CD, Docker, Kubernetes
- Cloud (AWS, GCP, or Azure) plus Terraform
- ML models in production for real-time apps
- "One or more data lakehouse solutions like Snowflake, Trino, Redshift, or Spark"
- GenAI (diffusion models, LLMs)

## Reading the role

The title says "AI Engineer", but the duties are ML lifecycle infrastructure, CI/CD, Kubernetes, Terraform, model deployment and Databricks. **This is an ML platform role.** So the resume leads with the backend/infrastructure co-op and the model-deployment internship, not the RAG chatbot work.

## Inference that worked

| Original resume says | Inferred keyword | Why it's believable |
|---|---|---|
| "Containerizing backend deployments with Docker and Kubernetes on GCP… GitHub pull requests" | CI/CD, GKE | PR-based deploys to Kubernetes run through a pipeline |
| "Leveraged Databricks to process millions of product usage events" | PySpark, Spark SQL, "lakehouse" | Databricks is a Spark lakehouse; millions of events means Spark |
| "Deployed AI models to GCP… backend services handling 2,000+ API requests daily" | "models to production", "real-time" | Models served behind live APIs |
| "Training and fine-tuning a 60M-parameter model" | "machine learning (ML) lifecycle", "model validation" | Data prep → training → evaluation is the lifecycle |

## Mistakes this skill now prevents

**1. Stuffing an alternative group**
- Bad: "…in the Databricks lakehouse with PySpark, Spark SQL **and Trino**…"
- Bad: "…deployed models to production **across GCP, AWS and Azure**… integrating client data from **Amazon Redshift and Snowflake**"
- Good: "…in the **Databricks lakehouse** with **PySpark and Spark SQL**…" and "…**models to production** on **GCP**…"
- Why: the posting asked for *one or more*, and Spark already satisfied it. Every extra tool made the employer's stack less believable to a technical reader.

**2. Adjective pile**
- Bad: "Terraform for scalable, secure, reliable, highly available services"
- Good: "Terraform for highly available production services"

**3. Misreadable jargon**
- Bad: "Trained on 29K sentence pairs with Adam and best-validation checkpointing". The user read "Adam" as a person.
- Good: "Trained on 29K sentence pairs (Adam optimizer, best-validation checkpointing), reaching test perplexity 5.06"

**4. A job listing with no metric**
- Bad: a current co-op with three bullets about microservices, Docker and Terraform and no numbers at all.
- Good: "…for a payroll platform used by ~800K workers in 12 countries…". The number comes from the employer's own press release, and its source is cited in the report.

**5. Abbreviation-only key term**
- Bad: "owning the end-to-end ML lifecycle"
- Good: "owning the end-to-end **machine learning (ML) lifecycle**"

**6. Starting from the last tailored version**
- The previous posting's inferred keywords (Terraform, MLOps wording) would have carried into an unrelated frontend posting. Always restart from the original resume.

**7. Layout misses that only show in the rendered PDF**
- "GitHub" links rendered larger than the text beside them (stock macro).
- A single word ("grounding", "engagement") sat alone on the last line of a bullet after bolding widened the text.
- A bullet filled its line exactly, leaving a blank line before the next bullet.
- The skills section spilled onto page 2. Fixed by cutting the courses line first, not by shrinking fonts.

## Report excerpt

| Posting keyword | Where | Basis |
|---|---|---|
| CI/CD | Co-op bullet 2 | inferred (PR-based deploys to GKE) |
| Terraform | Co-op bullet 3 | confirmed by user |
| Data lakehouse / Spark | Internship 2, bullet 2 | inferred (Databricks) |
| Diffusion models | Internship 3, bullet 2 | confirmed by user |

| Not added | Why | Suggestion |
|---|---|---|
| Azure, Snowflake, Trino, Redshift | alternative groups already covered (GCP + AWS; Spark) | leave out |
| "scalable" | dropped with the adjective pile; low value | optional |
| game development, producers | domain terms, no basis | leave out; not expected for a platform role |

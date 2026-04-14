# 🚀 Terraform Self-Service Infrastructure Platform

![Terraform](https://img.shields.io/badge/Terraform-1.5+-623CE4?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-black?logo=githubactions)
![License](https://img.shields.io/badge/License-MIT-blue)

---

## 📌 Overview

This project provides a **self-service infrastructure platform** using:

- 🏗️ **Terraform** for Infrastructure as Code  
- ⚙️ **GitHub Actions** for automation  
- ☁️ **AWS** for cloud resources  

Users can **provision and destroy infrastructure on demand** with built-in safety controls.

---

## 🎯 Features

✅ Self-service resource creation (EC2, S3)  
✅ Manual approval workflow (dev & prod)  
✅ Secure access using GitHub secrets  
✅ Per-resource **isolated Terraform state**  
✅ Safe destroy workflow with confirmation  
✅ Fallback deletion (handles drift)  
✅ Clean output summary in GitHub UI  

---

## 🏗️ Architecture


User → GitHub Actions → Terraform → AWS
↓
S3 Backend
↓
DynamoDB Lock


---

## 📁 Project Structure


.
├── .github/workflows/
│ ├── terraform.yml # Create resources
│ ├── terraform-destroy.yml # Destroy resources
│
├── backend.tf
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf


---

## ⚙️ Prerequisites

Before using this project, ensure:

- ✅ AWS Account (Free Tier supported)
- ✅ S3 bucket for Terraform state
- ✅ DynamoDB table for state locking
- ✅ GitHub repository secrets configured

---

## 🔐 GitHub Secrets

Add the following secrets:

| Secret Name | Description |
|------------|------------|
| `AWS_ACCESS_KEY_ID` | AWS access key |
| `AWS_SECRET_ACCESS_KEY` | AWS secret key |

---

## 🚀 Usage

### ▶️ Create Resources

1. Go to **Actions → Terraform Self-Service**
2. Click **Run workflow**
3. Provide inputs:

| Input | Example |
|------|--------|
| Resource | `ec2` / `s3` |
| Environment | `dev` / `prod` |
| Name | `my-server` |
| Confirm | `YES` |

---

### 💣 Destroy Resources

1. Go to **Actions → Terraform Destroy**
2. Click **Run workflow**
3. Provide inputs:

| Input | Example |
|------|--------|
| Resource | `s3` |
| Environment | `dev` |
| Name | `my-bucket` |
| Confirm | `DESTROY` |

---

## 🔒 Safety Features

This platform includes multiple safety layers:

- 🔐 User restriction (only authorized users)
- ✋ Manual approval before execution
- ⚠️ Confirmation input (`YES` / `DESTROY`)
- 📦 Resource-level state isolation
- 🔄 Terraform + AWS CLI fallback

---

## 📊 Outputs

After execution, results are displayed in GitHub summary:

### Example

| Resource | Value |
|----------|------|
| Instance ID | i-xxxx |
| Public IP | 13.x.x.x |
| Bucket Name | my-bucket |

---

## 🧠 Key Concepts

### Terraform State Isolation

Each resource is stored separately:


dev/ec2/my-server.tfstate
dev/s3/my-bucket.tfstate


This prevents accidental deletion of unrelated resources.

---

## ⚠️ Important Notes

- S3 bucket names must be globally unique  
- EC2 instances are tagged with Name for tracking  
- Destroy will only affect specified resource  

---

## 🔮 Future Enhancements

- 🔍 Resource listing before destroy  
- 🚫 Prevent destroy in production  
- 🔐 OIDC authentication (no AWS keys)  
- 📈 Cost monitoring integration  

---

## 🤝 Contributing

Feel free to fork and improve this project.

---

## 📜 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Poornesh H N**

---

⭐ If you found this useful, give it a star!

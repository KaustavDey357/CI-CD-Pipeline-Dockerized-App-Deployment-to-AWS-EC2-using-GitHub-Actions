## **CI/CD Pipeline: Dockerized App Deployment to AWS EC2 using GitHub Actions**

This project demonstrates a full **CI/CD pipeline** setup using **GitHub Actions**, **Docker**, and **AWS EC2**. Every time you push code to GitHub, the pipeline automatically builds the app, transfers it to an EC2 instance, and deploys it using Docker.

---

### **Architecture Overview**

```
GitHub Repo
    │
    ▼
GitHub Actions (CI/CD)
    │
    ├── Build Docker Image
    ├── SCP files to EC2
    └── SSH into EC2 → Run Docker container
    ▼
AWS EC2 Instance (App deployed)
```

---

### **Stack Used**

* **Docker** – Containerize the application
* **GitHub Actions** – Automate CI/CD
* **EC2 (Ubuntu)** – Host the application
* **SSH** – Secure connection to EC2
* **Nginx/PM2** – Serve the app (optional)

---

### **Features**

* Dockerfile to containerize the app
* GitHub Actions workflow to:

  * Build and test
  * Copy files to EC2
  * SSH and deploy using Docker
* Uses **GitHub Secrets** for secure keys and variables

---

### **Getting Started**

#### **1. Clone the Repo**

```bash
git clone https://github.com/yourusername/cicd-ec2-docker.git
cd cicd-ec2-docker
```

#### **2. Fill in Secrets (GitHub Settings → Secrets)**

| Key | Description |
| ------------- | ----------------------------------------------- |
| `EC2_HOST` | EC2 public IP or DNS |
| `EC2_USER` | Usually `ubuntu` |
| `EC2_SSH_KEY` | Your private key (PEM), base64-encoded |
| `EC2_PATH` | Path to deploy files (e.g., `/home/ubuntu/app`) |

---

### **3. Deploy Pipeline**

Each push to `main` branch triggers:

```yaml
.github/workflows/deploy.yml
```

Which does:

1. Checkout the code
2. Build Docker image
3. Copy files to EC2 using `scp`
4. SSH into EC2 and run:

   * `docker stop old_container`
   * `docker rm old_container`
   * `docker run -d ...`

---

### **Project Structure**

```
.
├── .github/workflows/deploy.yml # GitHub Actions pipeline
├── Dockerfile # Builds app container
├── app/ # Your Node.js / Python app
├── scripts/
│ └── deploy.sh # Script to run on EC2
├── .env.example # Sample .env structure
├── README.md
```

---

### **Access the App**

After deployment:

```bash
http://<EC2-Public-IP>:<Port>
```

Make sure the port is open in your EC2 Security Group.

---

### **Local Development**

```bash
docker build -t my-app .
docker run -p 3000:3000 my-app
```

## Author

**Kaustav Dey**

* GitHub: [@KaustavDey357](https://github.com/KaustavDey357)
* LinkedIn: [linkedin.com/in/KaustavDey357](https://www.linkedin.com/in/kaustav-dey-107593244?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app)
* Portfolio: [KaustavDey357.github.io](https://KaustavDey357.github.io)

---
```

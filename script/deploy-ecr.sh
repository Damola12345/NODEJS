docker build -t nodejs-api . 
docker tag nodejs-api:latest 192847931369.dkr.ecr.us-east-1.amazonaws.com/asm-api:latest
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin YOUR_AWS_ACCOUNT_NUMBER.dkr.ecr.us-east-1.amazonaws.com
docker push YOUR_AWS_ACCOUNT_NUMBER.dkr.ecr.us-east-1.amazonaws.com/nodejs-api:latest
aws ecs update-service --cluster nodejs-api --nodejs-api-service --force-new-deployment
docker build -t nodejs-api . 
docker tag nodejs-api:latest xxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/asm-api:latest
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin xxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com
docker push xxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/nodejs-api:latest
aws ecs update-service --cluster nodejs-api --nodejs-api-service --force-new-deployment
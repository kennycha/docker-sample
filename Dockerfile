# base
FROM node:19-alpine

# 작업 위치 설정
WORKDIR /usr/src/app

# 패키지 정보 복사
COPY package.json ./
COPY yarn.lock ./

# yarn berry 적용 및 패키지 설치
RUN yarn set version berry
RUN yarn --frozen-lockfile
RUN yarn install

# 전체 파일 복사
COPY . .

# 프로젝트 빌드
RUN yarn build

# 포트 설정
EXPOSE 3000

# 실행 커맨드
CMD [ "yarn", "start" ]

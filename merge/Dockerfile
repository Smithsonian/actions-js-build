FROM alpine:3.10

LABEL version="1.0.0"
LABEL repository="https://github.com/elstudio/actions-js-build"
LABEL homepage="https://github.com/elstudio/actions-js-build"
LABEL maintainer="el-studio Actions <servers+actions@el-studio.com>"

LABEL com.github.actions.name="GitHub Action for git merge"
LABEL com.github.actions.description="Merges a given branch onto the working branch."
LABEL com.github.actions.icon="git-commit"
LABEL com.github.actions.color="green"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

RUN apk --update --no-cache add git

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]

FROM forumone/gesso:4-node-v12-php-7.4

LABEL com.github.actions.name="GitHub Action to execute javascript build tools"
LABEL com.github.actions.description="Executes npm install, followed by gulp or grunt (whichever has a build file)."
LABEL com.github.actions.icon="truck"
LABEL com.github.actions.color="purple"

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]

# wercker-store-link

This is a Wercker step to store and restore all symbolic links in the specified directory. It's useful for users of NPM commands in `node_modules/.bin` across multiple Wercker's pipelines.

## wercker.yaml example

```yaml
box: node:6.5

test:
  steps:
    - npm-install
    - script:
      name: your_task
      code: echo "exec some NPM tasks..."
    - wacul/store-link:
      - type: store
      - prefix: node_modules/.bin

deploy:
  steps:
    - wacul/store-link:
      - type: restore
      - prefix: node_modules/.bin
    - script:
      name: your_task
      code: npm run build
```

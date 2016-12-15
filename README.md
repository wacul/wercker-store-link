# wercker-store-link

Stores and restores sym-links. It's useful for users of NPM commands in `node_modules/.bin` across multiple Wercker's workflows.

## Install 
Copy the `store-link` file from this repository to your repository.

## Usage

```sh
usage store-link -r [prefix]
      store-link -s [prefix]
```

## wercker.yaml example

```yaml
box: node:6.5

test:
  steps:
    - npm-install
    - script:
      name: your_task
      code: echo "exec some NPM tasks..."
    - script:
      name: store_sym_links_in_node_modules
      code: /bin/bash store-link -s

deploy:
  steps:
    - script:
      name: restore_sym_links_in_node_modules
      code: /bin/bash store-link -r
    - script:
      name: your_task
      code: echo "exec some NPM tasks..."
```

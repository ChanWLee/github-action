workflow "New workflow" {
  on = "pull_request"
  resolves = ["Deploy"]  # list로 여러 action을 지정하면 병렬로 실행됨
}

action "Deploy" {
  needs = "Test"
  uses = "ubuntu-latest"  # docker images
  args = "deploy"
}

action "Build" {
  uses = "ubuntu-latest"
}

action "Test" {
  needs = ["Build"]
  uses = "./action/blank"
}

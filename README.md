# Task manager Test Project
​
This is a simple Rails API based project designed according to the requiements.
​
## Requirements
​
- Rails 7
- Ruby 2.7
​
## Installation steps
​
- Clone the repo and check into it
- run bundle install
- run rails db:create db:migrate
-
​
## Run the app
​
```
  rails server
```

It will run rails server on `http://localhost:3000/`.
​
## Project structure
​
| Name         | Description                        |
| ------------ | ---------------------------------- |
| controllers/ | To handle requests coming to app   |
| models/      | To map db tables in our app        |
| serializers/ | To get serialized data in response |
​| specs/       | To write unit tests for the functionality |

## If I had extra time
​
> Would have completed the update tags against a task
> Add more test cases
​
## Blocker
​
- None

## Payload for task creation endpoint

```json
// POST api/v1/tasks
{
  "title": "New task 55 3",
  "task_tags_attributes": [
    { "tag_attributes": { "name": "ROR" } },
    { "tag_attributes": { "name": "ABC" } },
    { "tag_attributes": { "name": "XYZT" } }
  ]
}
```

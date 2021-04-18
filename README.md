# Personal purchases API

---

## Problem to solve

- Create personal purchase records.
- Get personal purchase records.

---

### Scope

#### Use cases

- It's possible to create a personal purchase record only with its value.
- It's possible to get all of the personal purchase records.
- It's possible to get all of the personal purchase records grouped by month.

#### Out of Scope

- Users can't authenticate
- Records aren't associated with the user.
- Records cannot be modified.
- Records cannot be deleted.

---

## Arquitecture

### Diagrams

TODO

### Data models

TODO

---

### Test suit

Create a test suit that validates the following use cases:

- Creation of personal purchase record.
- Getting the personal purchases.
- Getting the personal purchases grouped by month.

---

### Continuous integration

The tests are going to be executed in CircleCI to ensure the quality and operation of the project.
---

## Limitations

- The API can be sleeping about 3 and 7 seconds if not used in the last hour due to Heroku limitations.
- It's not possible to create a personal purchase record without value.

---

## Cost

We use the free plan with Heroku and Vercel.

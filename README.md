# README

## Task
Use Ruby on Rails to build a project conversation history. A user should be able to:
leave a comment
change the status of the project
The project conversation history should list comments and changes in status.

## Questions I would have asked colleagues
Given the limited information of the task, these are some of the questions that come to mind immediately (not in any particular order)

- ### What is the purpose of the project conversation history?
  Possible answers: Tracking progress, in-house communication, client updates, etc.

- ### Is there a specific design or UI/UX in mind?
  Possible answers: Wireframes, mockups etc of desired user experience.

- ### What are the acceptance criteria for this feature?
  Possible answers: Yes, there are list of specific conditions that must be met for the feature to be considered complete.

- ### Who are the users of this feature?
  Possible answers: Staff, clients, managers, all users etc. This impacts user interface and access control.)

- ### What is the timescale for this piece of work to be completed ?

- ### What are the possible statuses a project can have?
  Possible answers: A list of statuses, e.g., "Not Started," "In Progress," "Blocked," "Completed," "On Hold." Also, who has permission to change these statuses?)

- ### What type of users can leave comments?

- ### Are there any existing systems (or database models) we need to integrate with (e.g. CRM)?
  Possible answers: Yes/No, and if yes, more details will be required

- ### What is the expected volume of comments and status changes?
  Possible answers: Low, Medium, High. This helps to determine the database design and performance considerations

- ### Does a specific person own a project? and should they be notified of any status changes made by others?

- ### Do we need any notifications (e.g., email, in-app) when a comment is added or the status changes?
  Possible answers: Yes/No, and if yes, what kind of notifications and who should receive them

- ### What database will be used?
  Possible answers: PostgreSQL, MySQL, etc. This influences data modeling and performance optimization

- ### How will this feature be tested?
  Possible answers: Unit tests, integration tests, system tests.

- ### What is the deployment strategy for this feature?

- ### What kind of content can be included in a comment?
  Possible answers: Plain text, Markdown, mentions, etc.

- ### Is there a limit to the length of a comment?

- ### Can users edit or delete their own comments?
  Possible answers: Yes/No, and if yes, under what circumstances.

- ### Do we need to support threaded comments or replies?
  Possible answers: Yes/No.

- ### Who has permission to change the project status?
  Possible answers: Specific user roles or permissions.

- ### Is there a workflow associated with status changes(e.g. can a project only move from "In Progress" to "Completed")?
  Possible answers: Yes/No

- ### Should a comment be automatically generated when the status is changed?
  Possible answers: Yes/No, or perhaps an option to add a comment when changing the status.

## App details

* Ruby version: 3.2.2
* Rails version: 8.0.1
* Database: Postgres
* CSS: Tailwind

**Due to time constraints I made the following concessions:**
* Used erb rather than Slim as I am more familiar with erb format
* There are model units using RSpec and minimal request specs
* Users have to be logged in to access projects (basic authentication with email and password)
* Errors not completed on all forms
* Deletion of users not completed
* Editing/Updating a project not completed, although user can update the status and add comments from the Project#show page


**Getting started:**
* `bundle install`
* `bin/dev` or `rails s` to run the app
* `bundle exec rspec` to run the tests


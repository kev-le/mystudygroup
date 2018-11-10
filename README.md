# MyStudyGroup

MyStudyGroup provides a platform for post-secondary students who are seeking study partners or groups at their school.

## Features

MyStudyGroup Features:

1. Create study groups for a course
2. Find students with the same course nearby
3. Pin "study spots" for locations to study at
4. Private instant messaging with group members
5. Document sharing with group members

## Installation Steps

Installation steps:

1. create local db "mystudygroup_development"
2. bundle install
3. rails db:migrate
4. rails db:seed
5. rails s

## Problem Statement

The problem for some students is finding someone to study or discuss course work with. Students in study rooms usually wear their earphones and study alone which make it difficult to interact with them. By allowing students to find study groups, it will enhance their studying and they will be able to cover more content in depth. It is stressful enough as it is to be stuck on a problem or a theory that you can't wrap your head around. We believe the social aspect of MyStudyGroup can reduce barriers between students, save them trouble from finding classmates around them after lectures, and bring out the full benefits of study groups.

## Project Scope

The main feature of MyStudyGroup is that it provides a platform for students who are enrolled in the same course to find a study group or partner at a nearby location. MyStudyGroup utilizes the Google Maps API which allows users to pin a location on the map to form a “study spot” for a particular course. Other users that are enrolled in that course will be able view and join this study spot. When signing up, a user can sign-in with Facebook profiles which automatically sets up their user profile. MyStudyGroup also provides an instant messaging component where users in the same course can communicate in. These features will allow a user to create a profile, find/create/join a course, message anyone in that course, share documents, and be able to find a study group.

## User Stories

User story - A new user will be able to login with their facebook  or create a new profile. Then, the user will be prompted with a list of courses that they can join. Once they have picked their courses, they will see nearby students or study spots pertaining to their course list.  Users can contact other students via the application’s messaging app or they can join a study spot.

Admin story - An admin has the ability to view any user’s profile and edit them (including destroy). They can remove a user from a course for any reason.

## Competitive Analysis
There are apps on mobile that are similar to MyStudyGroup. In particular, GroupIt on iOS has features like finding nearby students in a particular course. What our app would allow for is the ability to meet new people with similar goals and have the ability to use our app as a platform to work efficiently amongst them.

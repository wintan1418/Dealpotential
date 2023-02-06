# DealPotential coding test

This project has a CompanyImporter job that deals with 2 models: Investment and Company.

A Company has many Investments, and it's a little bit complicated how that's solved: the `company_external_id` on the
Investment should match the `external_id` on the Company.

A problem has been discovered:

We want the `latest_investment_date` and `latest_investment_stage` on the Company to be populated with the
`investment_date` and `stage` from the most recent Investment for the company. That's currently not being populated
at all.

## Why?

Why do we want this? Because the database contains millions of Investments and Companies and we want the info about
the latest Investment to be cached on the actual Company record so we don't have to load all associated Investments
every single time.

## Your task

Solve the problem, but don't spend too much time on it. A quick solution that works well is good enough and then we
can discuss how it can be improved in a follow-up meeting.

What we're looking for:

- A zip file with the project should be emailed to peter@dealpotential.com
- It should contain solution that works (but it doesn't have to be the most efficient solution)
- New tests should demonstrate that the code works
- If you discover any ways of making our code better, feel free to reflect on that in the email

Good luck!# Dealpotential

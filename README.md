### Starling Roundup API

#### Introduction

This application represents a fully fledged roundup microservice that integrates with Starling bank's
API, `https://developer.starlingbank.com/docs`. Please make a developer account with Starling using the instructions
below.

This application can be run from a docker container. Please use the following commands to build the image and run the
container.

1) `docker build -t starling-roundup .`
2) `docker run --rm -p 8080:8080 starling-roundup`

Please find the Postman collection to guide you when testing both this API and Starling's API. As can be discovered from
the Postman collection, the features supported by the `starling-roundup` application are as follows:

1) **Create a roundup goal**
    * This endpoint creates a saving's account with Starling with a savings target for the amount specified. The maximum
      roundup amount each week and the roundup scale factor specified will be stored within this application's db
      store (H2).
2) **Retrieve a roundup goal**
    * If a roundup goal has been created, this endpoint will return information such as the savings target, the roundup
      scale factor and the maximum roundup amount.
3) **Edit a roundup goal**
    * This endpoint allows the user to edit the savings target, the maximum roundup amount or the roundup scale factor
      used for subsequent weekly roundups.
4) **Perform a weekly roundup**
    * This endpoint will retrieve the last week of transactions associated with the account used to set up the roundup
      account in order to calculate the total amount required to be rounded up. Then there will be a check that there
      are sufficient funds in the main account to make the transfer to the roundup savings account on week end. If so,
      money is deposited from the main account to the savings account. Possible weekly roundup states for a roundup
      action are: `TRANSFERRED`, `INSUFFICIENT_FUNDS` or `ZERO_ROUNDUP`.

#### Instructions to set up a Starling Developer Account

* Please create a Starling developer account at https://developer.starlingbank.com/. For this you will need to use an
  Authenticator app to set up 2FA.
* Register an application with Starling bank.
* Now create a sandbox environment and link it with this application.
* Create a customer or a set of customers.
* For a customer you will have an Account Holder UID, Access Token and Refresh Token. You will need this Access Token to
  authenticate yourself from this API to Starling's.
* You can simulate account activity, e.g. weekly transactions, manually or by simulating a whole series of activity with
  a click of the button.

#### Tech Stack

* `Java 11`
* `Docker`
* `Gradle`
* `SpringBoot`
* `Lombok`
* `Liquibase`
* `H2 database`
* `MSSQL`
* `JUnit5`
* `okhttp3 mockwebserver`
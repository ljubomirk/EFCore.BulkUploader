[![Build Status](https://dev.azure.com/triple-innovations-overlord/COMMANDO/_apis/build/status/COMMANDO?branchName=master)](https://dev.azure.com/triple-innovations-overlord/COMMANDO/_build/latest?definitionId=12)

# Introduction 

  COMMANDO - COupon Multichannel MANagement & Delivery Orchestration 

  A Coupon Management System (Coupon MS) for A1 Ljubljana 

  By Triple-Innovations 

# Getting Started
Check out this repositry and open solution COMMANDO for start working on project:
1.	Installation process
  - Open solutions COMMANDO in Visual Studio 2019

  - Install dependencies:
    1. On Solution right click -> Restore NuGet packages
    2. Rebuild solution

  - Setup local SQLServer
    1. Open PackageManager Console
    2. Call\
    `Update-Database`

  - Update local SQLDatabase after initial setup
    1. Change environment to Development (optional)\
    `$env:ASPNETCORE_ENVIRONMENT='Development'`
    1. Delete all objects from database\
    `Update-Database 0`
    1. Install database\
    `Update-Database`

  - Oracle output script
    1. Change environment to Staging\
    `$env:ASPNETCORE_ENVIRONMENT='Staging'`
    2. Generate DDL SQL\
    `Script-Migration -o DB/OracleDDL.sql`
    3. Fix partitions

  - Setup css and javascript minifiers
    1. Install extension "Bundler & Minifier"
    2. On materialize.css right click -> Bundler & Minifier -> Minify File 

  - Configuration and environments:
    1. Development
    - VS Configuration: Debug 
    - Settings: appsettings.Development.json
    - DB installation: migration script
    2. Integration (TBD)
    - VS Configuration: Release
    - Settings: appsettings.Integration.json
    - DB installation: migration script
    - Publish on pull request to master
    3. Staging
    - Settings: appsettings.Staging.json
    - DB installation DB/OracleDDL.sql
    - VS publish: method File system
      - Configuration: Release
      - Target Framework: netcoreapp3.1
      - Deployment mode: Self-Contained
      - Target-Runtime: win-x64
    4. Production (TBD)
    - Settings: appsettings.Production.json
    - VS publish: method File system
      - Configuration: Release
      - Target Framework: netcoreapp3.1
      - Deployment mode: Self-Contained
      - Target-Runtime: win-x64
    - DB installation DB/OracleDDL.sql

2.	Software dependencies 
  - Oracle EntityFrameworkCore -> Mvc.EntityFrameworkcore 2.2.6 
  - SoapCode 1.0.0
3.	Latest releases 
  1.0 Deployed to A1 production 20.5.2020

  0.8 Test environment week1
   - testing features of WebApp

4.	API references 
  API
    - build in MvcCore API
  SOAP 
    - SoapCore, for server & client
    - SoapUI for testing

# Build and Test
Code can be build locally from Visual Studio or by using MSBuild. Proposed environment is Visual Studio 2019: Professional or Community version is sufficient. 

All commited and pushed code during sprint planning will be rebuiled and installed after code review to development environment on Azure.

# Contribute
Please take in account that rules apply when pushing code to repositiory:
 - all changes must be well commented 
 - all changes must reference user story and task
 - all changes must be unit tested were it applies

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)
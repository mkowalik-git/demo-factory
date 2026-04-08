# Download the LiveStack
## Introduction

This lab shows how to run the Big Star demo in your own environment using the portable stack package and Podman Compose.

Estimated Time: 30 minutes

### Objectives

In this lab, you will:
- Download the portable demo package.
- Extract and prepare the local environment file.
- Start the full application stack with Podman Compose.
- Validate the app and stop the stack cleanly.

## Task 1: Download the portable package

1. Download the package from:
[ll-demo-agent.zip](https://c4u04.objectstorage.us-ashburn-1.oci.customer-oci.com/p/EcTjWk2IuZPZeNnD_fYMcgUhdNDIDA6rt9gaFj_WZMiL7VvxPBNMY60837hu5hga/n/c4u04/b/livelabsfiles/o/livestack/ll-demo-agent.zip)

2. Save the file to a local working directory that you can access from a terminal or command prompt.

Expected result:
- You have `ll-demo-agent.zip` saved on your machine in a known directory.

## Task 2: Move the package and prepare environment settings

1. Open a terminal or command prompt.

2. Create a new working directory outside of your `Downloads` folder:
    ```bash
    <copy>
    mkdir -p ~/livestack-demo
    <copy>
    ```

3. Move into the new working directory:
    ```bash
    <copy>
    cd ~/livestack-demo
    <copy>
    ```

4. Move the downloaded package from `Downloads` into this directory:
    ```bash
    <copy>
    mv ~/Downloads/ll-demo-agent.zip .
    <copy>
    ```

    Working from `Downloads` is not recommended, because some container tools such as Podman may not behave reliably there depending on your local environment.

5. Extract the package:
    ```bash
    <copy>
    unzip ll-demo-agent.zip
    <copy>
    ```

6. Move into the extracted folder:
    ```bash
    <copy>
    cd ll-demo-agent
    <copy>
    ```

7. Create your runtime environment file:
    ```bash
    <copy>
    cp .env.example .env
    <copy>
    ```

Expected result:
- You are inside the `ll-demo-agent` directory.
- The folder contains `compose.yaml`, `.env`, and all required app files.

## Task 3: Start the demo with Podman Compose

1. Start all services:
    ```bash
    <copy>
    podman compose up -d
    <copy>
    ```
2. Check service status:
    ```bash
    <copy>
    podman compose ps
    <copy>
    ```
3. Verify application health:
    ```bash
    <copy>
    curl http://localhost:5500/api/health
    <copy>
    ```
4. Open the demo in a browser:
    `http://localhost:5500`

Expected result:
- Database, ORDS, Ollama, and app services start successfully.
- Health check returns `status: ok`.
- The Big Star UI loads locally.

## Task 4: Stop the stack when finished

1. Stop and remove running containers:
    ```bash
    <copy>
    podman compose down
    <copy>
    ```

Expected result:
- The local demo stack is stopped cleanly.

## Task 5: Why this matters?

A portable runbook is what turns a demo into a repeatable field asset. By packaging the application and startup flow into a Podman Compose stack, teams can reproduce the same scenario in customer-adjacent environments with less setup drift and fewer handoffs. This makes it easier to validate value quickly, support workshops consistently, and move from guided demo sessions to practical self-service enablement.

## Credits & Build Notes
- **Author** - LiveLabs Team
- **Last Updated By/Date** - LiveLabs Team, March 2026

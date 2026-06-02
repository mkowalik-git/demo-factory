# Scene 7 Campaign and Rights Requests

## Introduction

A campaign operations manager, advertising analyst, rights coordinator, customer support agent, or application architect uses this page to understand the same media transaction from multiple angles. The persona needs a reliable operational list, relational line-item detail, API-friendly JSON document access, and spatial activation context.

This is difficult to implement when campaign headers, line items, content assets, audience accounts, coverage hubs, activation routes, and API payloads are handled in separate systems. Each copy creates synchronization risk and extra engineering work when the request model changes.

Oracle AI Database helps address these challenges by keeping the campaign request record in one governed platform while exposing it through the shape each workflow needs. Relational tables provide transactional detail. JSON Relational Duality Views expose the same request as a nested JSON document. Oracle Spatial adds activation route and distance context.

Estimated Time: 10 minutes

![Campaign and Rights Requests page with VPD banner, status filter, and request table](images/campaign-orders-rights-cases.png)

### Objectives

In this scene, you will:
- Review the **Campaign & Rights Requests** page and active request table.
- Inspect a specific campaign request row.
- Open the same request as relational operational detail.
- Compare that same request with the JSON document returned by `ORDERS_DV`.
- Review the activation route and spatial context for the request.

## Task 1: Review the campaign request workspace

1. Click **Campaign & Rights Requests** in the sidebar.
2. Review the active user banner. The current demo user is **Jessica Chen**, with **Admin** access and **20** visible requests on the page.
3. Review the status filter.
4. Review the request table columns: request id, audience account, location, status, line items, total, audience signal, coverage hub, and created time.
5. Focus on request **#100036**.

    ![Campaign request workspace with request 100036 visible](images/campaign-request-workspace.png)

In the current seeded dataset, request **#100036** is for **Ava Martinez** in **Edison, New Jersey**. It is in **Building Package** status, has **3** line items, totals **$348,250.00**, and uses **Seattle Live Event Operations Hub** as the coverage hub. This request will be the data point used through the rest of the scene.

## Task 2: Inspect the relational request detail

1. Click request **#100036**.

    ![Relational detail for campaign request 100036](images/campaign-request-relational-detail.png)

2. Confirm the **Relational** tab is selected.
3. Review audience account, location, total, activation cost, and line items.
4. Review content assets such as **Championship Highlights Rights**, **International Fandom Watch Party**, and **Lunar Kitchen Premiere Window**.

This view is useful for operations because the campaign request header and item detail remain normalized and easy to validate.

## Task 3: Compare the JSON Duality View

1. Click **JSON Duality View** in the expanded request panel.

    ![JSON Duality View for campaign request 100036](images/campaign-request-json-duality.png)

2. Review the source label **ORDERS_DV**.
3. Review the JSON document for request **100036**.
4. Notice that the document contains `_id`, `customerId`, `status`, `total`, `demandScore`, `createdAt`, and nested `items`.

This is the key point of the page. The JSON document is not a separate copy of the request. It is the same governed campaign data exposed through an Oracle JSON Relational Duality View. Application teams can use document-shaped access while operations teams continue to work with relational tables and SQL.

## Task 4: Review activation route context

1. Click **Activation Route** in the expanded request panel.

    ![Activation route for campaign request 100036](images/campaign-request-activation-route.png)

2. Review the coverage hub and audience account.
3. Review distance, estimated activation time, activation cost, route status, and activation progress.
4. Review the Oracle Spatial SQL example.

For request **#100036**, the page shows an activation route from **Seattle Live Event Operations Hub** to **Ava Martinez - Edison, New Jersey**. The route distance is about **2,394 miles** and the estimated activation time is about **43.5 hours**. The page explains that Oracle Spatial calculates distance between governed `SDO_GEOMETRY` points.

The value of Oracle AI Database is that the same campaign request can support operations, API access, and activation analysis without splitting the story across separate persistence layers.

You can move to the next scene.

## Credits & Build Notes
- **Author** - Oracle LiveLabs Team
- **Last Updated By/Date** - Oracle LiveLabs Team, 2026-06-02

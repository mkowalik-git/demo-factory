# Scene 10 Agent Console

## Introduction

The Agent Console demonstrates finance agent workflows. Users ask questions that route to market and compliance, client service routing, or transaction revenue agents. Ollama handles reasoning while Oracle provides data access, SQL and PL/SQL execution, and durable action logging.

Estimated Time: 12 minutes

![Agent Console](images/agent-console.png)

### Objectives

In this lab, you will:
- Open the Agent Console.
- Choose a runtime profile.
- Ask an agent question.
- Review recent agent actions and Oracle evidence.

## Task 1: Open the Agent Console

1. Click **Agent Console** in the left navigation.
2. Review the runtime profile selector.
3. Review the **Chat with AI Agents** examples and the **Recent Agent Actions** section.

Expected result:
- The scene opens as an agent workbench, not a static chat demo.
- The user sees that agent decisions are expected to become auditable records.

## Task 2: Ask an agent question

1. Click an example **Ask** tile, or type a finance operations question in the input.
2. Click **Send**.
3. Review the response and the agent team that handled the request.
4. Review **Recent Agent Actions** after a successful action.

Expected result:
- With the full stack healthy, the app routes the question to an agent team, executes Oracle-backed tools, and records an action.
- Recent actions show status, confidence, entity context, and payload summary.

## Task 3: Inspect Oracle Internals

1. Review the **Oracle Internals** panel.
2. Point out the agent teams, Oracle SQL and PL/SQL tools, `agent_actions`, `event_stream`, vector retrieval, and in-database ML references.
3. Explain that Ollama reasons, while Oracle remains the data and execution layer.

Expected result:
- The audience can see how agent behavior becomes traceable through Oracle-backed data and audit surfaces.

## Task 4: Why this matters?

Enterprise AI agents need more than a chat interface. This scene shows how finance agents can stay grounded in governed Oracle data, execute controlled SQL or PL/SQL tools, and leave an audit trail for operators and reviewers.

## Credits & Build Notes
- **Author** - LiveLabs Team
- **Last Updated By/Date** - LiveLabs Team, 2026-05-11

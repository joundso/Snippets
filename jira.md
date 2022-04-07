# JIRA Snippets

- [JIRA Snippets](#jira-snippets)
  - [JQL](#jql)
    - [Show all tickets related to an epic](#show-all-tickets-related-to-an-epic)

## JQL

### Show all tickets related to an epic

1. Find all task under a given Epic (i.e. EMEA-2459)

    ```sql
    "Epic Link" = EMEA-2459
    ```

2. Find all subtasks under returned issues above:

    ```sql
    issue IN subtasksOf(' "Epic Link" = EMEA-2459 ')
    ```

3. All together (Epic, Task & Subtask)

    ```sql
    key = EMEA-2459 OR "Epic Link" = EMEA-2459 OR issue IN subtasksOf(' "Epic Link" = EMEA-2459 ')
    ```

Source: <https://community.atlassian.com/t5/Jira-Software-questions/JQL-to-show-all-issues-and-subtasks-in-an-epic/qaq-p/1432325#M88404>.

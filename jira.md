# JIRA Snippets

- [JIRA Snippets](#jira-snippets)
  - [JQL](#jql)
    - [Show all tickets related to an epic](#show-all-tickets-related-to-an-epic)
    - [Show all tickets related to epics that fit some conditions](#show-all-tickets-related-to-epics-that-fit-some-conditions)
    - [Show all epics related to some issues](#show-all-epics-related-to-some-issues)

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

([Source](https://community.atlassian.com/t5/Jira-Software-questions/JQL-to-show-all-issues-and-subtasks-in-an-epic/qaq-p/1432325#M88404))

### Show all tickets related to epics that fit some conditions

1. Create a filter and assign the logic to select the epics:

    ```sql
    -- Safe this as filter and remember the new filter-id (e.g. filter=123)
    project = TESTPRJ AND component = PRJ AND labels in (dev-project, qs-projekt)
    ```

2. Create the JQL query searching for epics/issues defined in the previous filter AND all issues below them:

    ```sql
    issueFunction in issuesInEpics("filter = 123") OR filter = 123
    ```

Source: <https://scriptrunner.adaptavist.com/latest/jira/jql-functions.html#_more_complex_examples>

### Show all epics related to some issues

```sql
issueFunction in epicsOf("status = erledigt AND labels = Abrechnung") and component = CTP
```

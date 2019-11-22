import gitlab
import getpass
import datetime


def clear_pipelines(private_token, project_id):
    try:
        for pipeline in get_pipelines(private_token=private_token, project_id=project_id):
            pipeline.delete()
            print("Successfully cleared all pipelines!")
    except Exception as e:
        print("Something went wrong in function 'clear_pipelines':\n" + str(e))


def clear_failed_pipelines(private_token, project_id):
    try:
        for pipeline in get_pipelines(private_token=private_token, project_id=project_id):
            if pipeline.status == 'failed':
                print("Deleting pipeline " + pipeline.id + " now.")
                pipeline.delete()
                print("Deleted pipeline " + pipeline.id)
        print("Successfully cleared all failed pipelines!")
    except Exception as e:
        print("Something went wrong in function 'clear_failed_pipelines':\n" + str(e))


def clear_old_pipelines(private_token, project_id, days_since_last_update):
    try:
        for pipeline in get_pipelines(private_token=private_token, project_id=project_id):
            last_update_time_str = pipeline.updated_at.replace(
                'T', ' ').replace('Z', '')
            last_update_time = datetime.datetime.strptime(
                last_update_time_str, '%Y-%m-%d %H:%M:%S.%f')
            age_in_days = (datetime.datetime.now() - last_update_time).days
            if age_in_days > days_since_last_update:
                pipeline.delete()
                print("(x) Deleted pipeline " + str(pipeline.id) +
                      " because it is " + str(age_in_days) + " days old.")
            else:
                print("( ) Didn't deleted pipeline " + str(pipeline.id) +
                      " because it is only " + str(age_in_days) + " days old.")
    except Exception as e:
        print("Something went wrong in function 'clear_old_pipelines':\n" + str(e))


def get_pipelines(private_token, project_id):
    gl = gitlab.Gitlab('https://gitlab.miracum.org',
                       private_token=private_token)
    gl.auth()
    project = gl.projects.get(project_id)
    pipelines = project.pipelines.list(all=True)
    #print("Found " + pipelines.length? + " pipelines.")
    return pipelines


def delete_pipeline(private_token, project_id, pipeline_id):
    try:
        gl = gitlab.Gitlab('https://gitlab.miracum.org',
                           private_token=private_token)
        gl.auth()
        project = gl.projects.get(project_id)
        # pipelines = project.pipelines.list(all=True)
        pipeline = project.pipelines.get(pipeline_id)
        pipeline.delete()
        print("Deteleted pipeline " + str(pipeline_id) + " successfully.")
    except Exception as e:
        print("Something went wrong in function 'delete_pipeline':\n" + str(e))


## --- Variable definition: --- ##

token = getpass.getpass()      # or paste the token manually here
project_id = 1
days_to_keep = 10
pipeline_id = 1


## --- Function calls: --- ##

# clear_old_pipelines(private_token=token, project_id=project_id, days_since_last_update=days_to_keep)
# clear_failed_pipelines(private_token=token, project_id=project_id)
# delete_pipeline(private_token=token, project_id=project_id, pipeline_id=pipeline_id)

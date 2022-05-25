import yaml
import sys

print('Preparing env variables...')

# First read the env values in cloudbuild1.yaml into a temp variable

build_file_stream = open("cloudbuild1.yaml", 'r')
build_file = yaml.load(build_file_stream, Loader=yaml.FullLoader)
env_vars = []
for step in build_file['steps']:
    if 'env' in step.keys():
        vars = step['env']
        for evar in vars:
            if (evar not in env_vars):
                env_vars.append(evar)
build_file_stream.close()

values_file_stream = open("values.yaml", 'r')
values_file = yaml.load(values_file_stream, Loader=yaml.FullLoader)
env_value = values_file['env']
values_file_stream.close()

for env_var in env_vars:
    new_env = env_var.split("=")
    name = new_env[0]
    if name != 'SHORT_SHA':
        value = "$" + name
        e = { 'name' : name, 'value' : value }
        env_value.append(e)
values_file['env'] = env_value
values_file_stream_w = open("values_env.yaml", 'w')
yaml.dump(values_file, values_file_stream_w)
values_file_stream.close()
print('Prepared env variables...')
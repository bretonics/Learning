import { formatFiles, Tree, updateJson } from '@nrwl/devkit';

export default async function (tree: Tree, schema: any) {
  await updateJson(tree, 'workspace.json', (workspaceJson) => {
    workspaceJson.defaultProject = 'api';
    return workspaceJson;
  });
  await formatFiles(tree);
}

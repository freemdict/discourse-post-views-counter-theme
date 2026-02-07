import { withPluginApi } from "discourse/lib/plugin-api";

function customizePost(api) {
  const ReadsComponent = <template>
      <div title="post views" class="post-info post-metadata-reads" style="padding-right:6px; color: var(--primary-medium);" >{{@post.reads}} <svg class="fa-regular regular d-icon d-icon-eye svg-icon svg-node" aria-hidden="true"><use xlink:href="#eye"></use></svg></div>
    </template>;
  api.registerValueTransformer(
    "post-meta-data-infos",
    ({ value: metadata, context: { metaDataInfoKeys } }) => {
      metadata.add("post-reads", ReadsComponent, {
        before: metaDataInfoKeys.DATE,
        after: metaDataInfoKeys.REPLY_TO_TAB,
      });
    }
  );
}

export default {
  name: "post-reads",
  initialize() {
    withPluginApi((api) => {
      customizePost(api);
    });
  }
};

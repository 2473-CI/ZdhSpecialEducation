<template>
  <div style="border: 1px solid #ccc">
    <Toolbar
      style="border-bottom: 1px solid #ccc"
      :editor="editorRef"
      :defaultConfig="toolbarConfig"
      :mode="mode"
    />
    <Editor
      style="height: 500px; overflow-y: hidden"
      v-model="valueHtml"
      :defaultConfig="editorConfig"
      :mode="mode"
      @onCreated="handleCreated"
    />
  </div>
  <!-- <el-button @click="giveFaVal" type="primary">保存</el-button> -->
</template>

<script>
import "@wangeditor/editor/dist/css/style.css"; // 引入 css
import { onBeforeUnmount, ref, shallowRef, onMounted, defineExpose } from "vue";
import { Editor, Toolbar } from "@wangeditor/editor-for-vue";

export default {
  components: { Editor, Toolbar },
  props: ["value"],
  setup(props) {
    // 编辑器实例，必须用 shallowRef
    const editorRef = shallowRef();
    console.log(props);
    // 内容 HTML
    const valueHtml = ref("");
    console.log(props.value);
    valueHtml.value = props.value;

    // 模拟 ajax 异步获取内容
    onMounted(() => {
      //   setTimeout(() => {
      //     valueHtml.value = "<p>模拟 Ajax 异步设置内容</p>";
      //   }, 1500);
    });

    const toolbarConfig = {};
    const editorConfig = { placeholder: "请输入内容...", MENU_CONF: {} };
    editorConfig.MENU_CONF["uploadImage"] = {
      fieldName: "file",
      server: "/file/upload",
    };

    // 组件销毁时，也及时销毁编辑器
    onBeforeUnmount(() => {
      const editor = editorRef.value;
      if (editor == null) return;
      editor.destroy();
    });

    const handleCreated = (editor) => {
      editorRef.value = editor; // 记录 editor 实例，重要！
    };

    defineExpose({ valueHtml });

    return {
      editorRef,
      valueHtml,
      mode: "default", // 或 'simple'
      toolbarConfig,
      editorConfig,
      handleCreated,
    };
  },
};
</script>

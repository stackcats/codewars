function undoRedo(object) {
  const undo = [];
  let redo = [];
  return {
    set: (key, value) => {
      undo.push({ key, value: object[key] });
      object[key] = value;
      redo = [];
    },

    get: key => object[key],

    del: key => {
      undo.push({ key, value: object[key], type: 'del' });
      delete object[key];
      redo = [];
    },

    undo: _ => {
      const action = undo.pop();
      if (!action) throw new Error();
      redo.push({ key: action.key, value: object[action.key], type: action.type });
      object[action.key] = action.value;
    },

    redo: _ => {
      const action = redo.pop();
      if (!action) throw new Error();
      undo.push(action);
      if (action.type === 'del') delete object[action.key];
      else object[action.key] = action.value;
    }
  };
}

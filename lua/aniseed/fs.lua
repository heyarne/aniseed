local _2afile_2a = "fnl/aniseed/fs.fnl"
local _2amodule_name_2a = "aniseed.fs"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["_LOCALS"] = {}
  _2amodule_locals_2a = (_2amodule_2a)._LOCALS
end
local autoload = (require("aniseed.autoload")).autoload
local nvim, a = autoload("aniseed.nvim"), autoload("aniseed.core")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["a"] = a
local path_sep
do
  local os = string.lower(jit.os)
  if (("linux" == os) or ("osx" == os) or ("bsd" == os)) then
    path_sep = "/"
  else
    path_sep = "\\"
  end
end
_2amodule_2a["path-sep"] = path_sep
local function basename(path)
  return nvim.fn.fnamemodify(path, ":h")
end
_2amodule_2a["basename"] = basename
local function mkdirp(dir)
  return nvim.fn.mkdir(dir, "p")
end
_2amodule_2a["mkdirp"] = mkdirp
local function relglob(dir, expr)
  local dir_len = a.inc(string.len(dir))
  local function _2_(_241)
    return string.sub(_241, dir_len)
  end
  return a.map(_2_, nvim.fn.globpath(dir, expr, true, true))
end
_2amodule_2a["relglob"] = relglob
local function glob_dir_newer_3f(a_dir, b_dir, expr, b_dir_path_fn)
  local newer_3f = false
  for _, path in ipairs(relglob(a_dir, expr)) do
    if (nvim.fn.getftime((a_dir .. path)) > nvim.fn.getftime((b_dir .. b_dir_path_fn(path)))) then
      newer_3f = true
    end
  end
  return newer_3f
end
_2amodule_2a["glob-dir-newer?"] = glob_dir_newer_3f
local function macro_file_path_3f(path)
  return string.match(path, "macros.fnl$")
end
_2amodule_2a["macro-file-path?"] = macro_file_path_3f

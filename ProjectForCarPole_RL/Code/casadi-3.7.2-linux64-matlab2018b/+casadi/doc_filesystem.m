function varargout = doc_filesystem(varargin)
    %DOC_FILESYSTEM [INTERNAL] 
    %
    %  char = DOC_FILESYSTEM(char name)
    %
    %Get the documentation string for a plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/filesystem.hpp#L100
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/filesystem.cpp#L100-L102
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(1212, varargin{:});
end

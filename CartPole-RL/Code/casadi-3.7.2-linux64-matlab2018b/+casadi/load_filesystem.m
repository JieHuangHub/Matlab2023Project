function varargout = load_filesystem(varargin)
    %LOAD_FILESYSTEM [INTERNAL] 
    %
    %  LOAD_FILESYSTEM(char name)
    %
    %Explicitly load a plugin dynamically.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/filesystem.hpp#L96
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/filesystem.cpp#L96-L98
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(1211, varargin{:});
end

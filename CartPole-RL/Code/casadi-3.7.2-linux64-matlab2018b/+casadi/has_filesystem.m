function varargout = has_filesystem(varargin)
    %HAS_FILESYSTEM [INTERNAL] 
    %
    %  bool = HAS_FILESYSTEM(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/filesystem.hpp#L92
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/filesystem.cpp#L92-L94
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(1210, varargin{:});
end

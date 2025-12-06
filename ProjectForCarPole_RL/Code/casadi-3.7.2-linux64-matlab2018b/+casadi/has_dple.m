function varargout = has_dple(varargin)
    %HAS_DPLE [INTERNAL] 
    %
    %  bool = HAS_DPLE(char name)
    %
    %Check if a particular plugin is available.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dple.hpp#L31
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/dple.cpp#L31-L33
    %
    %
  [varargout{1:nargout}] = casadiMEX(908, varargin{:});
end

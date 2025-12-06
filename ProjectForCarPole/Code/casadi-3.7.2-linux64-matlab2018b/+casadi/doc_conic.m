function varargout = doc_conic(varargin)
    %DOC_CONIC [INTERNAL] 
    %
    %  char = DOC_CONIC(char name)
    %
    %Get the documentation string for a plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.hpp#L40
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.cpp#L40-L42
    %
    %
  [varargout{1:nargout}] = casadiMEX(861, varargin{:});
end

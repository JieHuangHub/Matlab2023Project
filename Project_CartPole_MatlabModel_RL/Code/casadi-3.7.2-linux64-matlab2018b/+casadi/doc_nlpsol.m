function varargout = doc_nlpsol(varargin)
    %DOC_NLPSOL [INTERNAL] 
    %
    %  char = DOC_NLPSOL(char name)
    %
    %Get the documentation string for a plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.hpp#L43
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.cpp#L43-L45
    %
    %
  [varargout{1:nargout}] = casadiMEX(874, varargin{:});
end

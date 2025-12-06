function varargout = doc_integrator(varargin)
    %DOC_INTEGRATOR [INTERNAL] 
    %
    %  char = DOC_INTEGRATOR(char name)
    %
    %Get the documentation string for a plugin.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L130
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L130-L132
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(839, varargin{:});
end

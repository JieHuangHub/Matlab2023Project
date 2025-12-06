function varargout = load_conic(varargin)
    %LOAD_CONIC [INTERNAL] 
    %
    %  LOAD_CONIC(char name)
    %
    %Explicitly load a plugin dynamically.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.hpp#L36
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/conic.cpp#L36-L38
    %
    %
  [varargout{1:nargout}] = casadiMEX(860, varargin{:});
end

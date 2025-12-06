function varargout = load_archiver(varargin)
    %LOAD_ARCHIVER [INTERNAL] 
    %
    %  LOAD_ARCHIVER(char name)
    %
    %Explicitly load a plugin dynamically.
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/archiver.hpp#L42
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/archiver.cpp#L42-L44
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(1208, varargin{:});
end

function varargout = tpsuperior(varargin)
% TPSUPERIOR MATLAB code for tpsuperior.fig
%      TPSUPERIOR, by itself, creates a new TPSUPERIOR or raises the existing
%      singleton*.
%
%      H = TPSUPERIOR returns the handle to a new TPSUPERIOR or the handle to
%      the existing singleton*.
%
%      TPSUPERIOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TPSUPERIOR.M with the given input arguments.
%
%      TPSUPERIOR('Property','Value',...) creates a new TPSUPERIOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tpsuperior_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tpsuperior_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tpsuperior

% Last Modified by GUIDE v2.5 14-Nov-2018 14:23:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tpsuperior_OpeningFcn, ...
                   'gui_OutputFcn',  @tpsuperior_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tpsuperior is made visible.
function tpsuperior_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tpsuperior (see VARARGIN)

% Choose default command line output for tpsuperior
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tpsuperior wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tpsuperior_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A as text
 %  A=str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B as text
  %   B=str2num(get(hObject,'String');


% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in limpiar.
function limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.validacion,'visible','off');
set(handles.validacion, 'String', '.');
set(handles.A,'String', '[ 0 0 0 ; 0 0 0 ; 0 0 0]' );
set(handles.B,'String', '[ 0 ; 0 ; 0 ]' );
set(handles.panel2,'visible','off');
set(handles.norma,'visible','off');
set(handles.norma, 'String', '');


% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)
% hObject    handle to salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.validacion,'visible','off');
set(handles.validacion, 'String', '.');
set(handles.A,'String', '[ 0 0 0 ; 0 0 0 ; 0 0 0]' );
set(handles.B,'String', '[ 0 ; 0 ; 0 ]' );
set(handles.panel2,'visible','off');
set(handles.norma,'visible','off');
set(handles.norma, 'String', '');

delete(handles.figure1); 


% --- Executes on button press in jacobi.
function jacobi_Callback(hObject, eventdata, handles)
% hObject    handle to jacobi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=get(handles.A, 'String');
A=str2num(coef);
diagonal=diag(A);
sumatoria=sum(abs(A),2)
posta=sumatoria-diagonal;

result = posta <= diagonal;
if(min(result)==0)
 
  set(handles.validacion,'visible','on');
  set( handles.validacion, 'ForegroundColor', 'red');
  set(handles.validacion, 'String', 'La matriz no cumple las condiciones');  
    
else


set(handles.validacion,'visible','off');
set(handles.validacion, 'String', '.');

%coef=get(handles.A, 'String');
ti=get(handles.B, 'String');
metodo=1;
tp_superior_2(coef,ti,metodo);
end
%user_response=tp_superior_2


% --- Executes on button press in gauss.
function gauss_Callback(hObject, eventdata, handles)
% hObject    handle to gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=get(handles.A, 'String');
A=str2num(coef);
diagonal=diag(A);
sumatoria=sum(abs(A),2)
posta=sumatoria-diagonal;

result = posta <= diagonal;
if(min(result)==0)
 
  set(handles.validacion,'visible','on');
  set( handles.validacion, 'ForegroundColor', 'red');
  set(handles.validacion, 'String', 'La matriz no cumple las condiciones');  
    
else
    
set(handles.validacion,'visible','off');
set(handles.validacion, 'String', '.');
%coef=get(handles.A, 'String');
ti=get(handles.B, 'String');
metodo=0;
tp_superior_2(coef,ti,metodo);

end


% --- Executes on button press in uno.
function uno_Callback(hObject, eventdata, handles)
% hObject    handle to uno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=get(handles.A, 'String');
A=str2num(coef);
result = norm(A,1);
set(handles.panel2,'visible','on');
set(handles.norma,'visible','on');
set(handles.norma, 'String', result);


% --- Executes on button press in dos.
function dos_Callback(hObject, eventdata, handles)
% hObject    handle to dos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=get(handles.A, 'String');
A=str2num(coef);
result = norm(A,2);
set(handles.panel2,'visible','on');
set(handles.norma,'visible','on');
set(handles.norma, 'String', result);

% --- Executes on button press in infinito.
function infinito_Callback(hObject, eventdata, handles)
% hObject    handle to infinito (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=get(handles.A, 'String');
A=str2num(coef);
result = norm(A,inf);
set(handles.panel2,'visible','on');
set(handles.norma,'visible','on');
set(handles.norma, 'String', result);



function norma_Callback(hObject, eventdata, handles)
% hObject    handle to norma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of norma as text
%        str2double(get(hObject,'String')) returns contents of norma as a double


% --- Executes during object creation, after setting all properties.
function norma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to norma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
coef=get(handles.A, 'String');
A=str2num(coef);
diagonal=diag(A);
sumatoria=sum(abs(A),2)
posta=sumatoria-diagonal;
E=0;
D=0;

result = posta <= diagonal;

if(min(result)==0)
    D=1;
end

estricto = posta < diagonal;
if(min(estricto)==0)
    E=1;
end
%Agrandar el texto ver si puede quedar verde?
if (E==0)
     set(handles.validacion,'visible','on');
     set( handles.validacion, 'ForegroundColor', 'green');
     set(handles.validacion, 'String', 'La matriz es Estrictamente Dominante');
else
     if (D==0)
         set(handles.validacion,'visible','on');
         set( handles.validacion, 'ForegroundColor', 'green');
         set(handles.validacion, 'String', 'La matriz es Diagonalmente Dominante');   
     else
         set(handles.validacion,'visible','on');
         set( handles.validacion, 'ForegroundColor', 'red');
         set(handles.validacion, 'String', 'La matriz no cumple las condiciones');   
     end 
 end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
set(handles.validacion,'visible','off');
set(handles.validacion, 'String', '.');
set(handles.A,'String', '[ 0 0 0 ; 0 0 0 ; 0 0 0]' );
set(handles.B,'String', '[ 0 ; 0 ; 0 ]' );
set(handles.panel2,'visible','off');
set(handles.norma,'visible','off');
set(handles.norma, 'String', '');

delete(hObject);

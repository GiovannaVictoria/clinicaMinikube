package br.ufscar.dc.dsw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.ufscar.dc.dsw.dao.IPacienteDAO;
import br.ufscar.dc.dsw.domain.Paciente;
import br.ufscar.dc.dsw.service.spec.IPacienteService;

@Service
@Transactional(readOnly = false)
public class PacienteService implements IPacienteService {
	
	@Autowired
	IPacienteDAO dao;

	@CacheEvict(value = { "pacientes", "pacientesPorId", "pacientesPorLogin" }, allEntries = true)
	public void salvar(Paciente paciente) {
		dao.save(paciente);
	}

	@CacheEvict(value = { "pacientes", "pacientesPorId", "pacientesPorLogin" }, allEntries = true)
	public void excluir(Long id) {
		dao.deleteById(id);
	}

	@Transactional(readOnly = true)
	@Cacheable(value = "pacientesPorId", key = "#id")
	public Paciente buscarPorId(Long id) {
		return dao.findById(id.longValue());
	}
	
	@Transactional(readOnly = true)
	@Cacheable(value = "pacientesPorLogin", key = "#username")
	public Paciente buscarPorLogin(String username) {
		return dao.getUserByUsername(username);
	}

	@Transactional(readOnly = true)
	@Cacheable("pacientes")
	public List<Paciente> buscarTodos() {
		return dao.findAll();
	}

}

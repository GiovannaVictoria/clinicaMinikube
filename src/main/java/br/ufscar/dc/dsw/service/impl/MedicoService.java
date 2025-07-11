package br.ufscar.dc.dsw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.ufscar.dc.dsw.dao.IMedicoDAO;
import br.ufscar.dc.dsw.domain.Medico;
import br.ufscar.dc.dsw.service.spec.IMedicoService;

@Service
@Transactional(readOnly = false)
public class MedicoService implements IMedicoService {
	
	@Autowired
	IMedicoDAO dao;

	@CacheEvict(value = { "medicos", "medicosPorEspecialidade", "medicosPorId", "medicosPorLogin" }, allEntries = true)
	public void salvar(Medico medico) {
		dao.save(medico);
	}

	@CacheEvict(value = { "medicos", "medicosPorEspecialidade", "medicosPorId", "medicosPorLogin" }, allEntries = true)
	public void excluir(Long id) {
		dao.deleteById(id);
	}

	@Transactional(readOnly = true)
	@Cacheable(value = "medicosPorId", key = "#id")
	public Medico buscarPorId(Long id) {
		return dao.findById(id.longValue());
	}
	
	@Transactional(readOnly = true)
	@Cacheable(value = "medicosPorLogin", key = "#username")
	public Medico buscarPorLogin(String username) {
		return dao.getUserByUsername(username);
	}
	
	@Transactional(readOnly = true)
	@Cacheable(value = "medicosPorEspecialidade", key = "#especialidade")
	public List<Medico> buscarPorEspecialidade(String especialidade) {
		return dao.findByEspecialidade(especialidade);
	}

	@Transactional(readOnly = true)
	@Cacheable("medicos")
	public List<Medico> buscarTodos() {
		return dao.findAll();
	}

}
